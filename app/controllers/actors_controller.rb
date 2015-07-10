class ActorsController < ApplicationController
  before_action :set_actor, only: [:show, :edit, :update, :destroy]
  def index
    @actors = Actor.search(params[:search])
  end

  def show; end

  def new
    @actor = Actor.new
    @actor.build_movie
    @movies = Movie.all
  end

  def create
    @actor = Actor.new(actor_params)
    @movies = Movie.all

    if @actor.save
      flash[:notice] = "Create success!"
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def edit
    @movies = Movie.all
  end

  def update
    if @actor.update(actor_params)
      flash[:notice] = "Update success!"
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def destroy
    @actor.destroy
    flash[:notice] = 'Delete success!'
    redirect_to action: 'index'
  end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end

  def actor_params
      params.require(:actor).permit(:name, :age, :movie_id, movie_attributes:[:id, :name, :description, :year, :price])
  end
end