class Stage
  attr_reader :id, :name, :location, :date

  @@stages = {}
  @@total_rows = 0
  def initialize(id, name, location, date)
      @id = id || @@total_rows += 1
      @name = name
      @location = location
      @date = date
  end

  def self.all
    @@stages.values()
  end

  def save
    @@stages[self.id] = Stage.new(self.id, self.name, self.location, self.date)
  end

  def ==(stage_to_compare)
  self.name().downcase().eql?(stage_to_compare.name.downcase()) && self.location().downcase().eql?(stage_to_compare.location.downcase())&&self.date().downcase().eql?(stage_to_compare.date.downcase())
end

  def self.clear
    @@stages = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@stages[id]
  end

  def self.search(stage_name)
    return_arry = @@stages.values.select { |stage| stage.name.downcase == stage_name.downcase}
    if return_arry == []
    else
      return_arry.sort_by(&:name)
    end
  end

  def artists
    Artist.find_by_stage(self.id)
  end

  def update(name, location, date)
    @name = name
    @location = location
    @date = date
  end

  def delete
    @@stages.delete(self.id)
  end

end
