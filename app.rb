require 'sinatra'
require 'feedzirra'
require 'flickraw'

FlickRaw.api_key="86f6c95a16cf6cdcac6451dbcecc277b"
FlickRaw.shared_secret="cb480187baea7c95"

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
    kadyn = flickr.people.findByUsername('kadynskrew')

    # list = flickr.people.getPhotos(:user_id => 'kadynskrew', :perpage => '20', :page => 1)
    logger.info(kadyn)
    erb :photos
end



get '/blog' do
    feed = Feedzirra::Feed.fetch_and_parse("http://koyandkadyn.blogspot.com/feeds/posts/default")
    logger.info(feed.title);
    logger.info(feed.entries.count);
    @entries = feed.entries[0..4]
    erb :blog
end

# get '/donate' do 
#     erb :coming_soon
# end