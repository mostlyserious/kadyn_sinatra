require 'sinatra'
require 'feedzirra'
require 'fleakr'

Fleakr.api_key="86f6c95a16cf6cdcac6451dbcecc277b"
# Fleakr.shared_secret="cb480187baea7c95"

helpers do
    def partial (template, locals = {})
      erb(template, :layout => false, :locals => locals)
    end
end

before do
    get_feed
    get_photos
end

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

def get_feed
    feed = Feedzirra::Feed.fetch_and_parse("http://koyandkadyn.blogspot.com/feeds/posts/default")
    @entries = feed.entries
end

def get_photos
    user = Fleakr.user('kadynskrew')
    @photos = user.photos
end




# get '/donate' do 
#     erb :coming_soon
# end