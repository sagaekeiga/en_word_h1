module Api
  module V1
    class EnWordsController < ApplicationController
    skip_before_filter :verify_authenticity_token

      def index
         @en_words = EnWord.all
         render json: @en_words
      end
      
      def h1
         @en_words = EnWord.where(grade: "h1")
         render json: @en_words
      end
      
      def h2
         @en_words = EnWord.where(grade: "h2")
         render json: @en_words
      end
      
      def h3
         @en_words = EnWord.where(grade: "h3")
         render json: @en_words
      end
      
      def j1
         @en_words = EnWord.where(grade: "j1")
         render json: @en_words
      end
      
      def j2
         @en_words = EnWord.where(grade: "j2")
         render json: @en_words
      end
      
      def j3
         @en_words = EnWord.where(grade: "j3")
         render json: @en_words
      end
      
      def search
         params = request.body.read
         logger.debug("params")
         logger.debug(params)
         logger.debug("params")
         @en_words = EnWord.where("name like '%#{params}%'") if !params.nil?
         render json: @en_words
      end
      
      def detail
         params = request.body.read
         logger.debug("params")
         logger.debug(params)
         logger.debug("params")
         @en_words = EnWord.find_by(name: params) if !params.nil?
         render json: @en_words
      end
        
    end
  end
end