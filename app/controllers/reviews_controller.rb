class ReviewsController < ApplicationController
  def new
    
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    @review.save
    redirect_to cocktail_path(@review.cocktail)
  end


  private 

  def review_params
    params.require(:review).permit(:score, :comment)
  end
end
