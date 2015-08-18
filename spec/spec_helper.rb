require("rspec")
require("pg")
require("list")
require("task")
require('capybara/rspec')

DB = PG.connect({:dbname => "to_do_database_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM tasks *;")
  end
end
