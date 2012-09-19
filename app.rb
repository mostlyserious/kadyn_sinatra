require 'sinatra'
require 'feedzirra'
require 'flickraw-cached'

FlickRaw.api_key="86f6c95a16cf6cdcac6451dbcecc277b"
FlickRaw.shared_secret="cb480187baea7c95"

helpers do
    def partial (template, locals = {})
      erb(template, :layout => false, :locals => locals)
    end

    def sq_img(info)
        FlickRaw.url_s(info)
    end

    def bigsq_img(info)
        FlickRaw.url_q(info)
    end

    def orig_img(info)
        FlickRaw.url_b(info)
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

get '/donate' do 
    redirect 'https://www.cff.org/great_strides/GenericDonation/?GSAppealCode=GWMTGS0312&idUI=347089&idVolunteer=1871334&walkid=7950'
end

get '/blog' do
    erb :blog
end

def get_feed
    feed = Feedzirra::Feed.fetch_and_parse("http://koyandkadyn.blogspot.com/feeds/posts/default")
    @entries = feed.entries

end

def get_photos
    @photos = flickr.people.getPublicPhotos(:user_id => '81955649@N04')
end




# get '/donate' do 
#     erb :coming_soon
# end