class Review < ApplicationRecord
  belongs_to :cocktail
  validates :score, inclusion: { in: 0..5 }
end
