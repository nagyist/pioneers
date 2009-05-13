# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "authlogic"
  config.gem "chriseppstein-compass", :lib => "compass", :source => "http://gems.github.com"
  config.gem "haml-edge", :lib => "haml"
  config.gem "pager-acts_as_list", :lib => "active_record/acts/list", :source => "http://gems.github.com"
  config.gem "qoobaa-to_hash", :lib => "to_hash"
  config.gem "state_machine"

  config.time_zone = 'UTC'
end
