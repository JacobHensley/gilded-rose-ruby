class Item
  attr_reader :days_remaining, :quality

  def initialize(quality, days_remaining)
    @quality = quality
    @days_remaining = days_remaining
  end

  def tick()
  end
end

class Normal < Item
  def tick()
    @days_remaining -= 1
    return if @quality == 0

    @quality -= 1
    @quality -= 1 if @days_remaining <= 0
  end
end

class Brie < Item
  def tick()
    @days_remaining -= 1
    return if @quality >= 50

    @quality += 1
    @quality += 1 if @days_remaining <= 0 && @quality < 50
  end
end

class Sulfuras < Item
  def tick()
  end
end

class Backstage < Item
  def tick()
    @days_remaining -= 1
    return              if @quality >= 50
    return @quality = 0 if @days_remaining < 0
    
    @quality += 1
    @quality += 1 if @days_remaining < 10
    @quality += 1 if @days_remaining < 5
  end
end

class GildedRose
  def self.new(name:, days_remaining:, quality:)
    klass_for(name).new(quality, days_remaining)
  end

  def self.klass_for(name)
    case name
      when 'Normal Item'
        return Normal
      when 'Aged Brie'
        return Brie
      when 'Sulfuras, Hand of Ragnaros'
        return Sulfuras
      when 'Backstage passes to a TAFKAL80ETC concert'
        return Backstage
    end
  end

end