require 'sinatra'

get '/' do
  erb :index
end

get '/about' do
    erb :about
end

get '/events' do
    erb :events
end

get '/photos' do
    erb :photos
end

get '/blog' do
    erb :blog
end

get '/donate' do 
    erb :coming_soon
end