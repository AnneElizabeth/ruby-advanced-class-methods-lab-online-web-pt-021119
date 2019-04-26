class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name_string)
    song = self.new
    song.name = song_name_string
    song
  end

  def self.create_by_name(song_name_string)
    song = self.new
    song.name = song_name_string
    song.save
    song
  end

  def self.find_by_name(song_name_string)
    self.all.find {|song| song.name == song_name_string}
  end

  def self.find_or_create_by_name(song_name_string)

    self.find_by_name(song_name_string)

    if find_by_name == nil
      self.create_by_name(song_name_string)
    else
      self.find_by_name(song_name_string)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(mp3_file)
    song = self.new
    song.name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[1]
    song.artist_name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song
  end

  def self.create_from_filename(mp3_file)
    song = self.new
    song.name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[1]
    song.artist_name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
