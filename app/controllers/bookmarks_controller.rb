class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    if @bookmark.id
      redict to @bookmark
    else
      render :new
      :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.delete
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:content, :movie_id)
  end
end
