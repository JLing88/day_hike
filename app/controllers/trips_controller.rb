class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @total_distance = @trip.total_distance
    @average_distance = @trip.average_distance
    @longest = @trip.max_distance
    @shortest = @trip.min_distance
  end
end
