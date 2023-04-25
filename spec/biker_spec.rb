require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
  describe '#initialize' do
    it 'exits with attributes' do
      biker = Biker.new("Kenny", 30)

      expect(biker).to be_a(Biker)
      expect(biker.name).to eq("Kenny")
      expect(biker.max_distance).to eq(30)
    end

    it 'has rides empty hash attribute' do
      biker = Biker.new("Kenny", 30)

      expect(biker.rides).to eq({})
    end

    it 'has acceptable terrain array' do
      biker = Biker.new("Kenny", 30)

      expect(biker.acceptable_terrain).to eq([])
    end

    it 'can add new terrain to learn' do
      biker = Biker.new("Kenny", 30)

      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hill)

      expect(biker.acceptable_terrain).to eq([:gravel, :hill])
    end

    it 'can log rides and update rides hash' do
      biker = Biker.new("Kenny", 30)

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

      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker.log_ride(ride2, 61.6)

      expected = {
        ride1 => [92.5, 91.1],
        ride2 => [60.9, 61.6]
      }

      expect(biker.rides).to eq(expected)
    end

    
  end
end