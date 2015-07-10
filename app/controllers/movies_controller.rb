class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :destroy, :edit, :update]
  def index
    @movies = Movie.search(params[:search]) 
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      flash[:notice] = "Create success"
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def show
    @actors = @movie.actors
  end

  def destroy
    @movie.destroy

    flash[:notice] = "Deleted success"
    redirect_to action: 'index'
  end

  def edit; end

  def update
    @movie.update movie_params

    flash[:notice] = "Update success"
    redirect_to action: 'index'
  end

  private
  def set_movie
    @movie = Movie.find params[:id]
  end

  def movie_params
    params.require(:movie).permit(:name, :price, :year, :description)
  end

end
