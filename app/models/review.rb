class Review < ApplicationRecord
  belongs_to :cocktail
  validates :score, inclusion: { in: 0..5, allow_nil: false }, presence: true
  validates :comment, presence: true, length: { minimum: 3 }
end
