class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @ingredients = Ingredient.all
    @dose = Dose.new
    @dose.cocktail = @cocktail
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktails_path
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end


  private

  def cocktail_params
    if params[:cocktail][:name] != ''
      params.require(:cocktail).permit(:name, :image)
    else
      nil
    end
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
