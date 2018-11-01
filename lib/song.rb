require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []


  def initialize(name, artist_name)
    @name = name
    @artist_name = artist_name
    @@all << self
  end

  def self.create
    Song.new("hi", "hello")
  end

  def self.new_by_name(name)
    Song.new(name, "hi")
  end

  def self.create_by_name(name)
    Song.new(name, "hurro")
  end

  # .find_by_name
  #     can find a song present in @@all by name (FAILED - 1)
  #     returns falsey when a song name is not present in @@all (FAILED - 2)

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end


  #.find_or_create_by_name
  #     invokes .find_by_name and .create_by_name instead of repeating code (FAILED - 3)
  #     returns the existing Song object (doesn't create a new one) when provided the title of an existing Song (FAILED - 4)
  #     creates a new Song object with the provided title if one doesn't already exist (FAILED - 5)

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      return find_by_name(name)
    else
      create_by_name(name)
    end
  end


  #   .alphabetical
  #     returns all the song instances in alphabetical order by song name (FAILED - 6)

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  #   .new_from_filename
  #     initializes a song and artist_name based on the filename format (FAILED - 7)

def Song.new_from_filename(filename)
  Song.new(filename.split(".")[0].split("-")[1].strip, filename.split(".")[0].split("-")[0].strip)
end

  #   .create_from_filename
  #     initializes and saves a song and artist_name based on the filename format (FAILED - 8)

  def Song.create_from_filename(filename)
    Song.new(filename.split(".")[0].split("-")[1].strip, filename.split(".")[0].split("-")[0].strip)
  end

  #   .destroy_all
  #     clears all the song instances from the @@all array (FAILED - 9)

  def Song.destroy_all
    @@all = []
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
