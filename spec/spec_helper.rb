ENV['RACK_ENV'] = 'test'
require('rspec')
require('pg')
require('sinatra/activerecord')
require('task')
require('list')
require('pry')

RSpec.configure do |config|
  config.after(:each) do
    Task.all().each do |task|
      task.destroy
    end
    List.all().each do |list|
      list.destroy
    end
  end
end
