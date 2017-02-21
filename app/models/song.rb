class Song

  attr_accessor :id, :name, :artist, :rating

  def initialize(hash)
    @id = hash['id']
    @name = hash['name']
    @artist = hash['artist']
    @rating = hash['rating']
  end

  def self.find(id)
    song_hash = Unirest.get("#{ENV['DOMAIN']}/songs/#{id}.json", headers: {"Accept" => "application/json", "Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => ENV["API_EMAIL"]}).body 
    Song.new(song_hash)
  end 

  def self.all
    songs_hashes = Unirest.get("#{ENV['DOMAIN']}/songs.json").body
    songs = []
    songs_hashes.each do |song_hash|
      songs << Song.new(song_hash)
    end 
    return songs
  end

  def self.delete(id)
    Unirest.delete("#{ENV['DOMAIN']}/songs/#{id}.json").body
    
  end

  def self.create(name, artist, rating)
    Unirest.post("#{ENV['DOMAIN']}/songs.json", :headers => {"Accept"=> "application/json"}, :parameters => {
    :name => params[:name],
    :artist => params[:artist],
    :rating => params[:rating]}   
    ).body
  end 

  def self.update(id, name, artist, rating)
    Unirest.patch("#{ENV['DOMAIN']}/songs/{id}.json", :headers => {"Accept"=> "application/json"}, :parameters => {
    :name => params[:name],
    :artist => params[:artist],
    :rating => params[:rating]}   
    ).body
  end 


end 


