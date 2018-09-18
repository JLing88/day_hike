class Trip < ApplicationRecord
  has_many :trip_trails
  has_many :trails, through: :trip_trails
  validates_presence_of :name

  def total_distance
    trails.sum(:length)
  end

  def average_distance
    trails.average(:length)
  end

  def max_distance
    trails.maximum(:length)
  end

  def min_distance
    trails.minimum(:length)
  end
end
