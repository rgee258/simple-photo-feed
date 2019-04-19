require 'flickraw'

class StaticPagesController < ApplicationController

  FlickRaw.api_key = ENV['FLICKRAW_API_KEY']
  FlickRaw.shared_secret = ENV['FLICKRAW_SHARED_SECRET']
  flickr = FlickRaw::Flickr.new

  def home
    if params.has_key?(:id)
      @photos = flickr.photos.getPopular(:format => "json", :user_id => params[:id], :per_page => "10")
    else
      @photos = nil
    end
  end
  
end
