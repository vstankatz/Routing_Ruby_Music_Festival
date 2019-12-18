class Artist
  attr_reader :name, :genre, :id, :stage_id
  @@artist_list = {}
  @@rows = 0

  def initialize(name, id, genre, stage_id)
    @name = name
    @id = id || @@rows += 1
    @genre = genre
    @stage_id = stage_id
  end

  def ==(artist_to_compare)
    (self.name() == artist_to_compare.name()) && (self.genre() == artist_to_compare.genre())
  end

  def self.all
    @@artist_list.values
  end

  def save
    @@artist_list[self.id] = Artist.new(self.name, self.id, self.genre, self.stage_id)
  end

  def self.find(id)
    @@artist_list[id]
  end

  def self.find_by_stage(stage_id)
    artists = []
    @@artist_list.values.each do |artist|
      if artist.stage_id == stage_id
        artists.push(artist)
      end
    end
    return artists
  end

  def stage
    Stage.find(self.stage_id)
  end

  def update(name, genre, stage_id)
    @name = name
    @genre = genre
    @stage_id = stage_id

    @@artist_list[self.id] = Artist.new(self.name, self.id, self.genre, self.stage_id)
  end

  def delete
    @@artist_list.delete(self.id)
  end

  def self.clear
    @@artist_list = {}
  end

end
