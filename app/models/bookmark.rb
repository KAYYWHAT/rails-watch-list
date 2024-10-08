class Bookmark < ApplicationRecord
  validates :movie_id, presence: true
  validates :list_id, presence: true
  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id }

  belongs_to :movie
  belongs_to :list
end
