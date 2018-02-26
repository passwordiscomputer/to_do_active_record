require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload("lib/**/*.rb")
require('./lib/task')
require('./lib/list')
require('rspec')
require('pg')
require('pry')

get('/') do
  @tasks = Task.all()
  @lists = List.all()
  erb(:index)
end

post('/') do
  name = params[:name]
  new_list = List.create({:name => name})
  @lists = List.all()
  erb(:index)
end

get('/lists/:id')do
  @list = List.find_by({:id => params[:id]})
  erb(:list)
end

post('/lists/:id') do
  description = params[:description]
  @list = List.find_by(id: params[:id])
  @list.tasks().create({:description => description})
  binding.pry

end

get('/tasks/:id/edit') do
  @task = Task.find(params.fetch("id").to_i())
  erb(:task_edit)
end

patch("/tasks/:id") do
  description = params.fetch("description")
  @task = Task.find(params.fetch("id").to_i())
  @task.update({:description => description})
  @tasks = Task.all()
  erb(:index)
end
