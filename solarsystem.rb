
class System

  def initialize
    @bodies = []
  end

  def add(body)
    @bodies << body
  end

  def total_mass
    total = 0
    @bodies.each do |body|
      total += body.mass
    end
    return total
  end

end

class Body

  def initialize(name, mass)
    @name = name
    @mass = mass
  end

  #Reader
  def mass
    @mass
  end

end

class Planet < Body

  def initialize(name, mass, day, year)
    super(name, mass)
    @day = day #hours it takes for planet to rotate all the way around once
    @year = year #days it takes for planet to orbit sun once
  end

end

class Star < Body

  def initialize(name, mass, type) #e.g. our sun is a G-type star
    super(name, mass)
    @type = type
  end

end

class Moon < Body

  def initialize(name, mass, month, planet)
    super(name, mass)
    @month = month #days it takes for moon to orbit planet
    @planet = planet #planet the moon orbits
  end

end

milky_way = System.new
puts "-------"
p mars = Planet.new("Mars", 639000000, 15, 250)
puts "--------"
p sun = Star.new("Sun", 1989000000000, "G-type")
puts "---------"
p moon = Moon.new("Moon", 734700000, 10, mars)
puts "---------"
p milky_way.add(mars)
p milky_way.add(sun)
p milky_way.add(moon)
puts "--------"
p milky_way.inspect
p milky_way.total_mass
