# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_shovell2_session',
  :secret      => '3444a36f8436d9190609a0162ec8209aea394df7a82cdb2a442b389217eeb4290de25350f9037346b39a4cf51cd5292c2bff3c1a32d89bf4607c2bf836ffc958'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
