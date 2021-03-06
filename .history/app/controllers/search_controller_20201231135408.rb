# require 'typhoeus'
class SearchController < ApplicationController
  

    def index 
        @search = params[:q]
        if @search 
            response = Typhoeus.get("http://www.omdbapi.com/?i=tt3896198&apikey=bc20ec47", params: {s: @search})
            @movies = JSON.parse(response.body).to_s
     #  byebug
        else
            @movies = []
            render :index
        end
    end
     
   def movie    
    imdbID = params[:q]
    if imdbID
        response = Typhoeus.get("http://www.omdbapi.com/?i=tt3896198&apikey=bc20ec47", params: {i: imdbID})
        @movie = JSON.parse(response.body)
    else
        @movie = {}
    end
   end
end
