require_relative '../config/environment.rb'
class Artist 
  extend Concerns::Findable
  attr_accessor :name 
  @@all =  []
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all 
    @@all.clear
  end
  
  def save
    @@all << self 
  end
  
  def self.create(name)
    @name = name 
    @@all << self 
    self
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless self.songs.include?(song)
  end
  
  def songs 
    @songs
  end
  
  def genres 
    songs.collect {|song| song.genre}.uniq 
  end
  
    
end