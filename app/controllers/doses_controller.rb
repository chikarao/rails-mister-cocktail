class DosesController < ApplicationController
  before_action :find_dose, only: [ :show, :edit, :update, :destroy ]

  def index
    @doses = Dose.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def edit

  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build(dose_params)
    # @dose = Dose.new(dose_params)
    # @dose.cocktail_id = @cocktail.id

    if @dose.save
      redirect_to @dose.cocktail
    else
       redirect_to @dose.cocktail
       # needs better solution
      # render 'new'
    end
  end

  def update
    @dose.update(dose_params)
    redirect_to doses_path
  end

  def destroy
    @dose.destroy
    redirect_to @dose.cocktail
  end

  private

  def find_dose
     @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id )
  end
end
