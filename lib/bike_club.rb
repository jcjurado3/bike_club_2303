class BikeClub
  attr_reader :name, :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def most_rides 
    @bikers.max_by do |biker|
      biker.rides.values.flatten.count
    end
  end

  def best_time(ride)
    @bikers.select do |biker| 
      biker.rides.key?(ride)
    end.min_by do |biker| 
      biker.personal_record(ride) 
    end
  end

  def bikers_eligible(ride)
    @bikers.select do |biker|
      @bikers.include?(biker) && biker.acceptable_terrain.include?(ride.terrain) && biker.max_distance >= ride.total_distance
    end
  end
end