class Song
  attr_accessor :name, :artist, :genre
  @@count = 0
  @@artists = []
  @@genres = []

  def initialize(name, artist, genre)
    @@count += 1
    @name = name
    @artist = artist
    @genre = genre
    @@artists << artist
    @@genres << genre
  end

  def self.count
    @@count
  end

  def self.artists
    @@artists.uniq
  end

  def self.genres
    @@genres.uniq
  end

  def self.artist_count
  # Hash[*@@artists.group_by {|v| v}.flat_map{|k, v| [k, v.size]}]
   artist_count = {}
   @@artists.each do |artist|
     if artist_count[artist]
       artist_count[artist] += 1
     else
      artist_count[artist] = 1
     end

   end
   artist_count
 end

  def self.genre_count
    Hash[*@@genres.group_by {|v| v}.flat_map{|k, v| [k, v.size]}]
  end
end
