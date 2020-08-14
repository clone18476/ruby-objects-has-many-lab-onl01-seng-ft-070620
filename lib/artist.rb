  
class Artist

    attr_accessor :name, :songs     #has attr_accessor for name 
  
    def initialize(name)   # initialized with a name 
      @name = name      
      @songs = []
    end
  
    def add_song(song)    # takes in an argument of a song 
      @songs << song
      song.artist = self    # associates that song with the artist 
    end                     # by telling the song that it belongs to that artist
  
    def add_song_by_name(name)   # takes in an argument of a song name 
      song = Song.new(name)  
      @songs << song             # associates that song with the artist by telling
      song.artist = self         # the song that it belongs to the artist  
    end
  
    def self.song_count    # is a class method that returns the total number of 
        Song.all.count     # songs associated to all existing artists
    end

    def songs    # has many songs   
        Song.all.select {|song| song.artist == self}
         # returns true if the array of songs is equal to the songs that the artist has, I think
    end
  end