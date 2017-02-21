class SongsController < ApplicationController


  def index 
      @songs = Song.all 
      
  end 
  
  def show
    @song = Song.find(params[:id])
  end 

  def new
  end 

  def create
    @song = Song.create(params[:name],params[:artist],params[:rating]).body

    redirect_to "/songs/#{params['id']}"
  end 

  def edit
    @song = Unirest.get("#{ENV['DOMAIN']}/songs/#{params[:id]}.json").body 
  end

  def update
    @song = Car.update(params[:name],params[:artist],params[:rating]).body
    redirect_to "/songs/#{@song['id']}"
  end

  def destroy
    
    @song = Song.delete(params[:id])
    redirect_to "/songs"
  end
end
