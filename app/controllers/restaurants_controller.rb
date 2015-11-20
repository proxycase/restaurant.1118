class RestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to action: :show, id: @restaurant.id
    else
      redirect_to action: :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to action: :show, id: @restaurant.id
    else
      redirect_to action: :update, id: @restaurant.id
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to action: :index
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :street, :city, :state, :zip, :phone)
  end

end
