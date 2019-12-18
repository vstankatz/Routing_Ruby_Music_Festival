require('sinatra')
require('sinatra/reloader')
require('./lib/stage')
require('./lib/artist')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @stages = Stage.all()
  erb(:home)
end

get('/LOTR_Fest') do
  @stages = Stage.all()
  erb(:home)
end

get('/LOTR_Fest/new_stage') do
  erb(:new_stage)
end

# View Stage
get('/LOTR_Fest/:id') do
  @stage = Stage.find(params[:id].to_i())
  @artists = Artist.all()
  erb(:view_stage)
end

# Creates stage, shows home page
post('/LOTR_Fest') do
  name = params[:stage_name]
  location = params[:stage_location]
  date = params[:stage_date]
  stage = Stage.new(nil, name, location, date)
  stage.save()
  @stages = Stage.all()
  erb(:home)
end

# Shows the new_artist page and preps it
get('/LOTR_Fest/:id/new_artist') do
  @stage = Stage.find(params[:id].to_i)
  erb(:new_artist)
end

# Viewing specific artist on a stage
get('/LOTR_Fest/:id/:artist_id') do
  @artist = Artist.find(params[:artist_id].to_i)
  @stage = Stage.find(params[:id].to_i)
  erb(:view_artist)
end

# Creating an Artist and showing the stage
post('/LOTR_Fest/:id') do
  @stage = Stage.find(params[:id].to_i)
  name = params[:artist_name]
  genre = params[:artist_genre]
  @artist = Artist.new(name, nil, genre, @stage.id)
  @artist.save()
  @artists = Artist.all()
  erb(:view_stage)
end

get('/LOTR_Fest/:id/edit') do
  @stage = Stage.find(params[:id].to_i)
  erb(:edit_stage)
end

# Update Stages, return to home
patch('/LOTR_Fest/:id/edit') do
  @stage = Stage.find(params[:id].to_i)
  name = params[:stage_name]
  location = params[:stage_location]
  date = params[:stage_date]
  @stage.update(name, location, date)
  @stages = Stage.all()
  erb(:home)
end

get('/LOTR_Fest/:id/:artist_id/edit') do
  @stage = Stage.find(params[:id].to_i)
  @artist = Artist.find(params[:artist_id].to_i)
  erb(:edit_artist)
end

# Update Artist, returns to Stage
patch('/LOTR_Fest/:id/:artist_id/edit') do
  @stage = Stage.find(params[:id].to_i)
  @artist = Artist.find(params[:artist_id].to_i)
  name = params[:artist_name]
  genre = params[:artist_genre]
  # make a dropdown select for stages
  stage_id = params[:stage_select]
  stage_id = stage_id.id

  @artist.update(name, genre, stage_id)
  @artists = Artist.all()
  erb(:view_stage)
end

# Delete stage
delete('/LOTR_Fest/:id/edit') do
  @stage = Stage.find(params[:id].to_i)
  @stage.delete()
  @stages = Stage.all()
  erb(:home)
end

# Delete stage
delete('/LOTR_Fest/:id/:artist_id/edit') do
  @stage = Stage.find(params[:id].to_i)
  @artist = Artist.find(params[:artist_id].to_i)
  @artist.delete()
  @artists = Artist.all()
  @stages = Stage.all()
  erb(:view_stage)
end
