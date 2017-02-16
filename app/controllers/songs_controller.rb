class SongsController < ApplicationController


  def index 
    @songs = Unirest.get("http://localhost:3000/api/v1/songs.json").body
  end 
  
  def show
    @song = Unirest.get("http://localhost:3000/api/v1/songs/#{params[:id]}.json").body 
  end 

  def new
  end 

  def create
    @song = Unirest.post("http://localhost:3000/api/v1/songs.json", :headers => {"Accept"=> "application/json"}, :parameters => {
    :name => params[:name],
    :artist => params[:artist],
    :rating => params[:rating]}   
    ).body

    redirect_to "/songs/#{params['id']}"
  end 

end
