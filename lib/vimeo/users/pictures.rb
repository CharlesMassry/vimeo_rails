module Vimeo
  module Users
    class Pictures < Vimeo::Base

      # Get a list of this user's portrait images.

      def self.pictures(user_id, access_token)
        get('/users/#{user_id}/pictures/?access_token=#{access_token}')
      end

      # Check if a user has a portrait.

      def self.has_portrait?(portraitset_id, access_token)
        get('/users/#{user_id}/pictures/#{portraitset_id}/#{portraitset_id}/?access_token=#{access_token}')
      end

    end
  end
end