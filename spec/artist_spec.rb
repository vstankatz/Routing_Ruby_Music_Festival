require 'rspec'
require 'artist'

describe '#Artist' do

  before(:each) do
    Stage.clear()
    Artist.clear()
    @stage = Stage.new(nil, "Hobbiton", "Hundred Acre Wood", "Friday")
    @stage.save()
  end

  describe ('.all') do
    it('displays a list of all artists') do
      artist1 = Artist.new("That One Guy", nil, "Psychedelic", @stage.id)
      artist1.save()
      artist2 = Artist.new("Jacob Collier", nil, "Jazz", @stage.id)
      artist2.save
      expect(Artist.all).to(eq([artist1, artist2]))
    end
  end

  describe('#==') do
    it('returns == if two artists are the same') do
      artist1 = Artist.new("That One Guy", nil, "Psychedelic", @stage.id)
      artist1.save()
      artist2 = Artist.new("That One Guy", nil, "Psychedelic", @stage.id)
      artist2.save()
      expect(artist1).to(eq(artist2))
    end
  end

  describe('#save') do
    it('Should save artists to @@artist_list') do
      artist1 = Artist.new("Jacob Collier", nil, "Jazz", @stage.id)
      artist1.save
      expect(Artist.all).to(eq([artist1]))
    end
  end

  describe('.find') do
    it('should be able to find artists by id') do
      artist1 = Artist.new("That One Guy", nil, "Psychedelic", @stage.id)
      artist1.save()
      artist2 = Artist.new("Jacob Collier", nil, "Jazz", @stage.id)
      artist2.save
      expect(Artist.find(artist2.id)).to(eq(artist2))
    end
  end

  describe('.find_by_stage') do
    it ('Should find all artists that belong to the stage') do
      artist1 = Artist.new("That One Guy", nil, "Psychedelic", @stage.id)
      artist1.save()
      artist2 = Artist.new("That One Guy", nil, "Psychedelic", @stage.id)
      artist2.save()
      expect(Artist.find_by_stage(@stage.id)).to(eq([artist1, artist2]))
    end
  end

  describe('#update') do
    it('should be able to update an artist') do
      artist1 = Artist.new("That One Guy", nil, "Psychedelic", @stage.id)
      artist1.save()
      artist1.update("Rob Zombie", "Rawk")
      expect(artist1.name).to(eq("Rob Zombie"))
    end
  end

  describe('#delete') do
    it('should delete artists successfullyyyyyyyy') do
      artist1 = Artist.new("That One Guy", nil, "Psychedelic", @stage.id)
      artist1.save()
      artist2 = Artist.new("That One Guy", nil, "Psychedelic", @stage.id)
      artist2.save()
      artist1.delete
      expect(Artist.all).to(eq([artist2]))
    end
  end

  describe('.clear') do
    it('should erase the list of artists') do
      artist1 = Artist.new("That One Guy", nil, "Psychedelic", @stage.id)
      artist1.save()
      Artist.clear
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#stage') do
    it("should find the stage by it's id") do
      artist1 = Artist.new("That One Guy", nil, "Psychedelic", @stage.id)
      artist1.save()
      expect(artist1.stage).to(eq(@stage))
    end
  end

end
