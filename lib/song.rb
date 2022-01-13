class Song

    attr_accessor :name

    @@all = []
    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        file_name_split = file_name.split(" - ")
        song_name = file_name_split[1]
        artist_name = file_name_split[0]
        new_song = Song.new(song_name)
        new_song.artist = Artist.find_or_create_by_name(artist_name)
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end
