class FavoritesController < ApplicationController

  def create
    current_user.favorites.create(blog_id: params[:blog_id])
    respond_to do |format|
      format.js { render :index }
    # redirect_to blogs_path
    end
  end

  def destroy
    current_user.favorites.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.js { render :index }
    # redirect_to blogs_path
    end
  end

end
