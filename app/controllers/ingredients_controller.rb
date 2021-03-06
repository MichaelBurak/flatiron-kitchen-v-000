class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if
      @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render new_ingredient_path
    end
  end

  def show
    @ingredient = Ingredient.find_by(params[:id])
  end


  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)

    redirect_to ingredients_path
  end

  def index
    @ingredients = Ingredient.all
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity)
  end

end
