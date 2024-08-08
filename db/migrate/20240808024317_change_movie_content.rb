class ChangeMovieContent < ActiveRecord::Migration[7.1]
  def change
    remove_column :movies, :content
    add_column :movies, :overview, :text
  end
end
