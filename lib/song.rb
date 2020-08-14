class Song
    attr_accessor :name, :artist
    @@all = []
  
    def initialize(name)  #is initalized with an argument of a name 
      @name = name    #name has a name
      @@all << self   #  pushes new instances into a class variable called @@all upon initialization
    end
 
    def self.all  # .all is a class method that returns an array of all song instances that have been created
        @@all      # @@all is a class variable set to an array
    end
  
    def artist_name    #artist_name knows the name of its artist
        self.artist ? self.artist.name : nil
        # '#artist' belongs to an artist
        # returns nil if the song does not have an artist
    end
  end