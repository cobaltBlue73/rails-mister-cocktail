
class Dose < ApplicationRecord
  belongs_to :cocktail, required: true
  belongs_to :ingredient, required: true
  validates :description, :cocktail, :ingredient, presence: true
  validates_uniqueness_of :cocktail, :ingredient, scope: %i[cocktail ingredient]
end
