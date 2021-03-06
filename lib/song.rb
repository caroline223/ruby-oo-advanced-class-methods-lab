class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create # song class constructor 
    song = self.new
    self.all << song 
    return song 
  end 

  def self.new_by_name(name) ##Instantiates a song with a name property
    song = self.new
    song.name = name 
    return song 
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    return song 
  end

  def self.find_by_name(name)
    result = self.all.detect {|song| song.name == name}
    result 
  end
  
  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    if result
      return result 
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    song_sorted = self.all.sort_by {|song| song.name}
    song_sorted 
  end 

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    array[1] = array[1].chomp(".mp3")
    song = self.new
    song.name = array[1]
    song.artist_name = array[0]
    return song 
  end

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    return song 
  end

  def self.destroy_all
    self.all.clear 
  end
end
