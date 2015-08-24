require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/task")
require("./lib/list")
require("pg")


get("/") do
  @tasks = Task.not_done()
  erb(:index)
end

get("/lists/new") do
  erb(:list_form)
end

post("/lists") do
  name = params.fetch("name")
  list = List.create({:name => name})
  erb(:success)
end

get('/lists') do
  @lists = List.all()
  erb(:lists)
end

get('/lists/:id') do
  @list = List.find(params.fetch("id").to_i())
  erb(:list)
end

post("/tasks") do
  description = params.fetch("description")
  list_id = params.fetch("list_id").to_i()
  @list = List.find(list_id)
  @task = Task.create({:description => description, :list_id => list_id})
  erb(:success)
end

get("/lists/:id/edit") do
  @list = List.find(params.fetch("id").to_i())
  erb(:list_edit)
end

delete("/lists/:id") do
  @list = List.find(params.fetch("id").to_i())
  @list.destroy()
  @lists = List.all()
  erb(:lists)
end

patch("/lists/:id") do
  name = params.fetch("name")
  @list = List.find(params.fetch("id").to_i())
  @list.update({:name => name})
  @lists = List.all()
  erb(:lists)
end

delete("/tasks/:id") do
  @task = Task.find(params.fetch("id").to_i())
  list_id = @task.list_id()
  @list = List.find(list_id)
  @task.destroy()
  @tasks = Task.all()
  erb(:list)
end

patch("/tasks/:id") do
  description = params.fetch("description")
  @task = Task.find(params.fetch("id").to_i())
  list_id = @task.list_id()
  @list = List.find(list_id)
  @task.update({:description => description})
  @tasks = Task.all()
  erb(:list)
end
