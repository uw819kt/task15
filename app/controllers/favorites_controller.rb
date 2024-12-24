class FavoritesController < ApplicationController

  def create
    @favorites = current_user.favorites.create(blog_id: params[:blog_id])
    @blogs = Blog.find(params[:blog_id])
    binding.irb
    respond_to do |format|
      format.js { render :index }
    # redirect_to blogs_path
    end
  end

  def destroy
    @favorites = current_user.favorites.find_by(id: params[:id])
    @favorites.destroy if @favorites
    respond_to do |format|
      format.js { render :index }
    # redirect_to blogs_path
    end
  end

end
