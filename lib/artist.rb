class Artist
    extend Concerns::Findable
    
    attr_accessor :name, :songs
    @@all = []

    def self.all #Class reader
        @@all
    end

    def initialize(name) #Hook method
        @name = name
        @songs = []
    end

    def save #Helper method
        self.class.all << self
    end

    def self.destroy_all #Helper method
        @@all.clear
    end

    def self.create(name)
        artist = new(name)
        artist.save
        artist
    end

    def add_song(song)
        song.artist = self unless song.artist
        @songs << song unless @songs.include?(song)
    end

    def genres
        songs.collect{ |song| song.genre }.uniq 
    end

end