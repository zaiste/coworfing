class HomeController < ApplicationController
  def index
  end

  def map
    @places = []
    authorize! :see, :places

    @places = Place.limit(params[:limit].to_i)

    respond_to do |format|
      format.html 
      format.json { }
    end
  end

  def location
    @location = { 'city' => request.location.city, 'country' => request.location.country }
    respond_to do |format|
      format.html 
      format.json { render json: @location }
    end
  end
end
