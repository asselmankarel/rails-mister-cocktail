class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
  end

  def create
    if dose_params['description'] == ''
      @dose = Dose.new
    else
      @dose = Dose.new(description: dose_params['description'])
      @dose.ingredient = Ingredient.find(dose_params['ingredient_id'])
      @dose.cocktail = Cocktail.find(dose_params['cocktail_id'])
    end
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render 'doses/new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private 
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
