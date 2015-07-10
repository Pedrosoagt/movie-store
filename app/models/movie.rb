class Movie < ActiveRecord::Base
  has_many :actors
  #accepts_nested_attributes_for :actors
  # Presence
  validates :name, :year, :price, presence: true
  # Numeric
  validates :year, numericality: true
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
  # uniqueness
  validates :name, uniqueness: true

  def self.search(search)
    if search
      self.where "name LIKE ?", "%#{search}%"
    else
      self.all
    end
  end

  def list_actor
    Actor.where "movie_id = ?", self.id
  end
end