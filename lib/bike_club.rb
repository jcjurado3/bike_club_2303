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
end