class PlacesController < ApplicationController

  def index
    render json: Place.all
  end

  def create
    place = Place.new(
      name: params[:name],
      address: params[:address]
    )
    if place.save
      render json: place
    else
      render place.errors.full_messages
    end
  end

  def show
    place = Place.find(params[:id])
    render json: place
  end

  def update
    place = Place.find(params[:id])
    place.name = params[:name] || place.name
    place.address = params[:address] || place.address
    if place.save
      render json: place
    else
      render place.errors.full_messages
    end
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy
    render json: {message: "Place has been successfully destroyed."}
  end

end
