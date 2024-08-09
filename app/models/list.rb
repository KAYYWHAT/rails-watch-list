class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_one_attached :photo

  before_destroy :destroy_associated_movies

  private

  def destroy_associated_movies
    movies.destroy_all
  end
end
