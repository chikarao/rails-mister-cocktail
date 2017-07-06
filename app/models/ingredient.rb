class Ingredient < ApplicationRecord
  has_many :doses

  validates :name, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end

