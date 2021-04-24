class SightingsController < ApplicationController
  def index 
    sighting = Sighting.all 
    render json: sighting
  end
  def show
    sighting = Sighting.find_by(id: params[:id])
    if sighting
      render json: sighting.to_json(include: [:bird, :location])
    else
      render json: { message: 'No sighting found with that id' }
    end
  end 
end
