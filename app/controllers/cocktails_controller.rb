class CocktailsController < ApplicationController
before_action :find_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(strong_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render(:new)
    end
  end

  private

  def strong_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end


