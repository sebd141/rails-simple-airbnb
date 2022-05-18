class FlatsController < ApplicationController

  before_action :find_flat, only: [:edit, :show, :update, :destroy ]

  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path(@flat)
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guest)
  end
end
