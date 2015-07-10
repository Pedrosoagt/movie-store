class Actor < ActiveRecord::Base
  belongs_to :movie
  accepts_nested_attributes_for :movie

  validates :name, :age, presence: true

  def self.search(search)
    if search
      self.where 'name LIKE ?', "%#{search}%"
    else
      self.all
    end
  end
end
