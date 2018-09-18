require "rails_helper"

describe "As a visitor" do
  context "they visit a trail show page" do
    it "displays the name, address, and total length" do
      trip_1 = Trip.create(name: "Trip 1")
      trip_2 = Trip.create(name: "Trip 2")
      trip_3 = Trip.create(name: "Trip 3")
      trail_1 = trip_1.trails.create(name: "Trail 1", address: "123 Main St.", length: 10)
      trail_2 = trip_1.trails.create(name: "Trail 2", address: "123 Blue St.", length: 20)
      trail_3 = trip_2.trails.create(name: "Trail 3", address: "123 Red St.", length: 30)
      trail_4 = trip_3.trails.create(name: "Trail 4", address: "123 White St.", lenght: 40)

      visit trail_path(trail_1)

      expect(page).to have_content()
    end
  end
end
