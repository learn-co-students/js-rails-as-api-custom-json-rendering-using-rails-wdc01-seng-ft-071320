class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds
    # render json: birds, only: [:id, :name, :species] # not display the entire data
    render json: birds, except: [:created_at, :updated_at] # not display the entire data
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      # render json: bird
      # render json: {id: bird.id, name: bird.name, species: bird.species }
      render json: bird, only: [:id, :name, :species]
      # render json: bird.slice(:id, :name, :species) # not display the entire data
    else
      render json: {message: "Bird not found"}
    end
  end
end