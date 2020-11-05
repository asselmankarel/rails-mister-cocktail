class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true, length: { minimum: 3 }
  validates :cocktail_id, uniqueness: { scope: :ingredient_id }
end
