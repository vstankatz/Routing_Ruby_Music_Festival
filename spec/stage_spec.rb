require 'rspec'
require 'stage'

describe '#Stage' do

  before(:each) do
    Stage.clear()
  end

  describe('.all') do
    it('shows all the stages') do
      stage1 = Stage.new(nil, "Shire", "Fangor", "Friday")
      stage1.save
      stage2 = Stage.new(nil, "Quickbeam", "Lothlorian", "Satrday")
      stage2.save
      expect(Stage.all).to(eq([stage1, stage2]))
    end
  end

  describe('#save') do
    it('should save the stage to the array') do
      stage1 = Stage.new(nil, "Shire", "Fangor", "Friday")
      stage1.save
      expect(Stage.all).to(eq([stage1]))
    end
  end

  describe('#==') do
    it('should be the same stage if they have the same attributes') do
      stage1 = Stage.new(nil, "Shire", "Fangor", "Friday")
      stage1.save
      stage2 = Stage.new(nil, "Shire", "Fangor", "Friday")
      stage2.save
      expect(stage1).to(eq(stage2))
    end
  end

  describe('.clear') do
    it('should clear all the stages') do
      stage1 = Stage.new(nil, "Shire", "Fangor", "Friday")
      stage1.save
      stage2 = Stage.new(nil, "Quickbeam", "Lothlorian", "Satrday")
      stage2.save
      Stage.clear
      expect(Stage.all).to(eq([]))
    end
  end

  describe('.find') do
    it('should find the stage based on id') do
      stage1 = Stage.new(nil, "Shire", "Fangor", "Friday")
      stage1.save
      stage2 = Stage.new(nil, "Quickbeam", "Lothlorian", "Satrday")
      stage2.save
      expect(Stage.find(stage1.id)).to(eq(stage1))
    end
  end

  describe ('.search') do
    it('should search for the right stage based on name') do
      stage1 = Stage.new(nil, "Shire", "Fangor", "Friday")
      stage1.save
      stage2 = Stage.new(nil, "Quickbeam", "Lothlorian", "Satrday")
      stage2.save
      expect(Stage.search("shire")).to(eq([stage1]))
    end
  end

  describe('#update') do
    it('should update the stage info') do
      stage1 = Stage.new(nil, "Shire", "Fangor", "Friday")
      stage1.save
      stage1.update("Hobbiten", "Shire", "Friday")
      expect(stage1.name).to(eq("Hobbiten"))
    end
  end

  describe('#delete') do
    it('should delete the chosen stage') do
      stage1 = Stage.new(nil, "Shire", "Fangor", "Friday")
      stage1.save
      stage2 = Stage.new(nil, "Quickbeam", "Lothlorian", "Satrday")
      stage2.save
      stage1.delete
      expect(Stage.all).to(eq([stage2]))
    end
  end

  describe('#artists') do
    it('should show what artists are playing at the stage') do
      Artist.clear
      stage1 = Stage.new(nil, "Hobbiton", "Shire", "Friday")
      stage1.save
      artist1 = Artist.new("Beyonce", nil, "Hip-hop", stage1.id)
      artist1.save
      artist2 = Artist.new("Jay-Z", nil, "Hip-hop", stage1.id)
      artist2.save
      expect(stage1.artists).to(eq([artist1, artist2]))
    end
  end

end
