# frozen_string_literal: true

class DosesController < ApplicationController
  before_action :set_dose, only: %i[destroy]

  # POST /doses
  # POST /doses.json
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id])

    respond_to do |format|
      if @dose.save
        format.html { redirect_to @dose.cocktail, notice: 'Dose was successfully created.' }
        format.json { render :show, status: :created, location: @dose.cocktail }
      else
        format.html { render :new }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doses/1
  # DELETE /doses/1.json
  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to doses_url, notice: 'Dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dose
    @dose = Dose.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def dose_params
    params.require(:dose).permit(:description)
  end
end
