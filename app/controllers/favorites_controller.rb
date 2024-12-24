class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.create(blog_id: params[:blog_id])
    @blog = Blog.find(params[:blog_id])
    respond_to do |format|
      format.js { render :index }
    # redirect_to blogs_path
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id])
    @favorite.destroy if @favorite
    @blog = @favorite.blog
    respond_to do |format|
      format.js { render :index }
    # redirect_to blogs_path
    end
  end

end
