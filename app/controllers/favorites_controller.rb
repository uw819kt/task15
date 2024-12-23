class FavoritesController < ApplicationController

  def create
    @favorites = current_user.favorites.create(blog_id: params[:blog_id])
    respond_to do |format|
      format.js { render 'index', locals: { favorites: @favorites } }
    # redirect_to blogs_path
    binding.irb
    end
  end

  def destroy
    @favorites = current_user.favorites.find_by(id: params[:id])
    @favorites.destroy if @favorites
    respond_to do |format|
      format.js { render 'index', locals: { favorites: @favorites } }
    # redirect_to blogs_path
    end
  end

end
