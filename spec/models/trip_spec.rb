require 'rails_helper'

describe Trip, type: :model do
  describe 'relationships' do
    it {should have_many :trip_trails}
    it {should have_many(:trails).through(:trip_trails)}
  end

  describe 'class methods' do
    it "#total_distance" do
      trip_1 = Trip.create(name: "Trip 1")
      trip_2 = Trip.create(name: "Trip 2")
      trip_3 = Trip.create(name: "Trip 3")
      trail_1 = trip_1.trails.create(name: "Trail 1", address: "123 Main St.", length: 10)
      trail_2 = trip_1.trails.create(name: "Trail 2", address: "123 Blue St.", length: 20)
      trail_3 = trip_2.trails.create(name: "Trail 3", address: "123 Red St.", length: 30)

      expect(trip_1.total_distance).to eq(30)
    end

    it "#average_distance" do
      trip_1 = Trip.create(name: "Trip 1")
      trip_2 = Trip.create(name: "Trip 2")
      trip_3 = Trip.create(name: "Trip 3")
      trail_1 = trip_1.trails.create(name: "Trail 1", address: "123 Main St.", length: 10)
      trail_2 = trip_1.trails.create(name: "Trail 2", address: "123 Blue St.", length: 20)
      trail_3 = trip_2.trails.create(name: "Trail 3", address: "123 Red St.", length: 30)

      expect(trip_1.average_distance).to eq(15)
    end

    it "#max_distance" do
      trip_1 = Trip.create(name: "Trip 1")
      trip_2 = Trip.create(name: "Trip 2")
      trip_3 = Trip.create(name: "Trip 3")
      trail_1 = trip_1.trails.create(name: "Trail 1", address: "123 Main St.", length: 10)
      trail_2 = trip_1.trails.create(name: "Trail 2", address: "123 Blue St.", length: 20)
      trail_3 = trip_2.trails.create(name: "Trail 3", address: "123 Red St.", length: 30)

      expect(trip_1.max_distance).to eq(20)
    end

    it "#min_distance" do
      trip_1 = Trip.create(name: "Trip 1")
      trip_2 = Trip.create(name: "Trip 2")
      trip_3 = Trip.create(name: "Trip 3")
      trail_1 = trip_1.trails.create(name: "Trail 1", address: "123 Main St.", length: 10)
      trail_2 = trip_1.trails.create(name: "Trail 2", address: "123 Blue St.", length: 20)
      trail_3 = trip_2.trails.create(name: "Trail 3", address: "123 Red St.", length: 30)

      expect(trip_1.min_distance).to eq(10)
    end
  end
end
