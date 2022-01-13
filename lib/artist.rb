class Artist
    attr_accessor :name
  
    @@all = []
    
    def initialize(name)
      @name = name
      @song = []
      self.class.all << self
    end
  
    
    def self.all
      @@all
    end
  
    def songs
      @song + Song.all.select {|song| song.artist == self}
    end
  
    def add_song(new_song)
      @song << new_song
    end
  
    def self.find_or_create_by_name(new_name)
      all_name = Artist.all.map {|artist| artist.name}
      if all_name.include?(new_name)
        Artist.all.find {|artist| artist.name == new_name}
      else
        Artist.new(new_name) 
      end
    end
  
    def print_songs
      @song.each {|song| puts "#{song.name}"}
    end
  end
  
  class Song
    attr_reader :name
    attr_accessor :artist
  
    @@all = []
    def initialize(name)
      @name = name
      self.class.all << self
    end
  
    def self.all
      @@all
    end
  
  end
