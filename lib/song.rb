class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  
  def initialize(name,artist=nil,genre=nil)
    @name = name
    self.artist=(artist) unless artist == nil 
    self.genre=(genre) unless genre == nil
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
  
   def artist
    @artist 
  end
  
  def artist=(artist)
    @artist = artist unless @artist 
    artist.add_song(self)
    
  end
  
  def genre 
    @genre 
  end
  
  def genre=(genre)
    unless self.genre 
      genre.songs << self
      @genre = genre 
    end
    
  end
  
  def self.find_by_name(name)
    @@all.detect do |song| 
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || create(name)
  end
    
end
