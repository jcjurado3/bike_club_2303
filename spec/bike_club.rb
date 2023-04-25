require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
  before(:each) do
    @bikeclub = BikeClub.new("Hammer Head Bikers")
  end

  describe '#initialize' do
    it 'exits with attributes' do
      expect(@bikeclub).to be_a(BikeClub)
      expect(@bikeclub.name).to eq("Hammer Head Bikers")
      
    end

    it 'has list of bikers' do
      expect(@bikeclub.bikers).to eq([])
    end

    it 'can add bikers' do
      expect(@bikeclub.bikers).to eq([])
      biker1 = Biker.new("Kenny", 30)

      @bikeclub.add_biker(biker1)

      expect(@bikeclub.bikers).to eq([biker1])
    end
  end

  describe '#most_rides' do
    it 'can return the rider with the most rides' do
      biker1 = Biker.new("Kenny", 30)
      biker2 = Biker.new("Athena", 15)
      biker1.learn_terrain!(:gravel)
      biker1.learn_terrain!(:hills)
      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)

      ride1 = Ride.new(
        {
        name: "Walnut Creek Trail", 
        distance: 10.7, 
        loop: false, 
        terrain: :hills})

      ride2 = Ride.new(
        {
          name: "Town Lake", 
          distance: 14.9, 
          loop: true, 
          terrain: :gravel})

      ride3 = Ride.new(
        {
          name: "Wicked Valley Trail", 
          distance: 25.9, 
          loop: true, 
          terrain: :hills})

      biker1.log_ride(ride1, 92.5)
      biker1.log_ride(ride2, 91.1)
      biker2.log_ride(ride1, 60.9)
      biker1.log_ride(ride3, 61.6)

      @bikeclub.add_biker(biker1)
      @bikeclub.add_biker(biker2)

      expect(@bikeclub.most_rides).to eq(biker1)
    end
  end
end