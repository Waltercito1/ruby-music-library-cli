class Genre
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
        genre = new(name)
        genre.save
        genre
    end

    def artists
        songs.collect{ |song| song.artist }.uniq
    end
end
