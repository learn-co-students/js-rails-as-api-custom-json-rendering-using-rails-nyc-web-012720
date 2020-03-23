class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # or   render json: birds, except: [:created_at, :updated_at]
    # and of course thats rails magic, without it looks like
    #   render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    render json: {id: bird.id, name: bird.name, species: bird.species } 
    # or  render json: bird.slice(:id, :name, :species)
  end

  #//Error Handling for when the id is not found
  # //If the bird id isnt found, bird will = nil
  # so we can handle below as such
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end

end