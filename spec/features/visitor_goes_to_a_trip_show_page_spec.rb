require 'rails_helper'

describe "As a visitor" do
  describe "they visit a trip show page" do
    it "displays a list of trails associated with that trip" do
      trip_1 = Trip.create(name: "Trip 1")
      trip_2 = Trip.create(name: "Trip 2")
      trip_3 = Trip.create(name: "Trip 3")
      trail_1 = trip_1.trails.create(name: "Trail 1", address: "123 Main St.", length: 10)
      trail_2 = trip_1.trails.create(name: "Trail 2", address: "123 Blue St.", length: 20)
      trail_3 = trip_2.trails.create(name: "Trail 3", address: "123 Red St.", length: 30)

      visit trip_path(trip_1)

      expect(page).to have_content("#{trail_1.name}")
      expect(page).to have_content("#{trail_2.name}")
      expect(page).to have_content("#{trail_1.address}")
      expect(page).to have_content("#{trail_2.address}")
      expect(page).to have_content("Length: #{trail_1.length}")
      expect(page).to have_content("Length: #{trail_2.length}")
    end

    it 'displays a average hiking distance for the trip' do
      trip_1 = Trip.create(name: "Trip 1")
      trip_2 = Trip.create(name: "Trip 2")
      trip_3 = Trip.create(name: "Trip 3")
      trail_1 = trip_1.trails.create(name: "Trail 1", address: "123 Main St.", length: 10)
      trail_2 = trip_1.trails.create(name: "Trail 2", address: "123 Blue St.", length: 20)
      trail_3 = trip_2.trails.create(name: "Trail 3", address: "123 Red St.", length: 30)

      visit trip_path(trip_1)

      expect(page).to have_content("Average Hiking Distance: 15")
    end

    it 'displays a longest trail for the trip' do
      trip_1 = Trip.create(name: "Trip 1")
      trip_2 = Trip.create(name: "Trip 2")
      trip_3 = Trip.create(name: "Trip 3")
      trail_1 = trip_1.trails.create(name: "Trail 1", address: "123 Main St.", length: 10)
      trail_2 = trip_1.trails.create(name: "Trail 2", address: "123 Blue St.", length: 20)
      trail_3 = trip_2.trails.create(name: "Trail 3", address: "123 Red St.", length: 30)

      visit trip_path(trip_1)

      expect(page).to have_content("Longest Trail: 20")
    end

    it 'displays a shortest trail for the trip' do
      trip_1 = Trip.create(name: "Trip 1")
      trip_2 = Trip.create(name: "Trip 2")
      trip_3 = Trip.create(name: "Trip 3")
      trail_1 = trip_1.trails.create(name: "Trail 1", address: "123 Main St.", length: 10)
      trail_2 = trip_1.trails.create(name: "Trail 2", address: "123 Blue St.", length: 20)
      trail_3 = trip_2.trails.create(name: "Trail 3", address: "123 Red St.", length: 30)

      visit trip_path(trip_1)

      expect(page).to have_content("Shortest Trail: 10")
    end

    context "they click on a trail name" do
      it "displays a show page for that trail" do
        trip_1 = Trip.create(name: "Trip 1")
        trip_2 = Trip.create(name: "Trip 2")
        trip_3 = Trip.create(name: "Trip 3")
        trail_1 = trip_1.trails.create(name: "Trail 1", address: "123 Main St.", length: 10)
        trail_2 = trip_1.trails.create(name: "Trail 2", address: "123 Blue St.", length: 20)
        trail_3 = trip_2.trails.create(name: "Trail 3", address: "123 Red St.", length: 30)

        visit trip_path(trip_1)

        click_on "Trail 1"

        expect(current_path).to eq(trail_path(trail_1))
      end
    end
  end
end
