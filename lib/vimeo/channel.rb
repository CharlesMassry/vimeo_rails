require 'uri'
def hash_to_query(hash)
  return URI.encode(hash.map{|k,v| "#{k}=#{v}"}.join("&"))
end

module Vimeo
  class Channel < Vimeo::Base

    # Get a list of all Channels. GET #

    def self.find_all
      get('/channels')
    end

    # Get a Channel. GET #
    #
    # channel_id = channel ID[Integer] or channel name

    def self.find_channel(channel_id)
      get("/channels/#{channel_id}")
    end

    ##################### Users ####################

    # Get a list of users who follow a Channel. GET #
    #
    # channel_id = channel ID[Integer] or channel name

    def self.users(channel_id)
      get("/channels/#{channel_id}/users")
    end

    ##################### Videos ####################

    # Get a list of videos in a Channel. GET #
    #
    # channel_id = channel ID[Integer] or channel name

    def self.videos(channel_id, opts={})
      url = "/channels/#{channel_id}/videos"
      if opts.present?
        url << "?" + hash_to_query(hash)
      end

      get(url)
    end

    # Check if this Channel contains a video. GET #
    #
    # channel_id = channel ID[Integer] or channel name

    def self.has_video?(channel_id, video_id)
      get("/channels/#{channel_id}/videos/#{video_id}")
    end
  end
end