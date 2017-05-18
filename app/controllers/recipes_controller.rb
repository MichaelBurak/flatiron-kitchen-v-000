class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if
    @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render new_recipe_path
    end
  end

  def show
    @recipe= Recipe.find_by(params[:id])
  end

private

def recipe_params
  params.require(:recipe).permit(:name)
end

end
