require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  def test_should_not_be_valid_without_name
    s = Story.create(:name => nil, :link => 'www.asdf.com')
    assert s.errors.on(:name)
  end

  def test_should_create_story
    s = Story.create(:name => 'test name', :link => 'testlink.com')
    assert s.valid?
  end

  def test_should_not_be_valid_without_link
    s = Story.create(:name => 'My test submission', :link => nil)
    assert s.errors.on(:link)
    end

  def test_should_have_a_votes_association
    assert_equal [ votes(:one), votes(:two) ], stories(:one).votes.find(:all, :order => 'id DESC')
  end

  def test_should_return_highest_vote_id_first
#    puts "one id = #{votes(:one).id}, two id = #{votes(:two).id}"
#    assert_equal votes(:two), stories(:one).votes.latest.first
  end

  def test_should_return_3_latest_votes
    10.times { stories(:one).votes.create }
    assert_equal 3, stories(:one).votes.latest.size
  end

  def test_should_be_associated_with_user
    assert_equal users(:patrick), stories(:one).user
  end

  def test_should_increment_votes_counter_cache
    stories(:two).votes.create
    stories(:two).reload
    assert_equal 1, stories(:two).attributes['votes_count']
  end

  def test_should_decrement_votes_counter_cache
    stories(:one).votes.first.destroy
    stories(:one).reload
    assert_equal 1, stories(:one).attributes['votes_count']
  end

  def test_should_cast_vote_after_creating_story
    s = Story.create(:name => 'a name', :link => 'alink.com', :user => 'patrick')
    assert_equal users(:patrick), s.votes.first.user 
  end
end
