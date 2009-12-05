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
end
