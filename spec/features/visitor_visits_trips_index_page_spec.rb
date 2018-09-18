require 'rails_helper'

describe "As a visitor" do
  describe "they visit the trips index page" do
    it "displays a list of all hiking trip names" do
      trip_1 = Trip.create(name: "Trip 1")
      trip_2 = Trip.create(name: "Trip 2")
      trip_3 = Trip.create(name: "Trip 3")
      trail_1 = trip_1.trails.create(name: "Trail 1", address: "123 Main St.", length: 10)
      trail_2 = trip_1.trails.create(name: "Trail 2", address: "123 Blue St.", length: 20)
      trail_3 = trip_2.trails.create(name: "Trail 3", address: "123 Red St.", length: 30)

      visit trips_path

      expect(page).to have_content("#{trip_1.name}")
      expect(page).to have_content("#{trip_2.name}")
      expect(page).to have_content("#{trip_3.name}")
    end

    context "they click on the name of a trail" do
      it "displays a list of trails included in that trip" do
        trip_1 = Trip.create(name: "Trip 1")
        trip_2 = Trip.create(name: "Trip 2")
        trip_3 = Trip.create(name: "Trip 3")
        trail_1 = trip_1.trails.create(name: "Trail 1", address: "123 Main St.", length: 10)
        trail_2 = trip_1.trails.create(name: "Trail 2", address: "123 Blue St.", length: 20)
        trail_3 = trip_2.trails.create(name: "Trail 3", address: "123 Red St.", length: 30)

        visit trips_path

        within("#trip-#{trip_1.id}") do
          click_on "#{trip_1.name}"
        end

        expect(current_path).to eq(trip_path(trip_1))
        expect(page).to have_content("#{trail_1.name}")
        expect(page).to have_content("#{trail_2.name}")
      end
    end
  end
end
