# frozen_string_literal: true

begin
  require "debug" unless ENV["CI"] == "true"
rescue LoadError
end

require "ruby-next/language/runtime" unless ENV["CI"] == "true"

require "mock-suey"

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec

  config.example_status_persistence_file_path = "tmp/rspec_examples.txt"
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.order = :random
  Kernel.srand config.seed
end
