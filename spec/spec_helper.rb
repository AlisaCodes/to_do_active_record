require("rspec")
require("pg")
require("sinatra/activerecord")
require("list")
require("task")
require('capybara/rspec')


ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.after(:each) do
    Task.all().each() do |task|
      task.destroy()
    end
  end
end
