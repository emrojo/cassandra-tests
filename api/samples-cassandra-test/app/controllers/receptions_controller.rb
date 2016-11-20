class ReceptionsController < ApplicationController
  def show
  	render :json => Gender.where(:gender => 'female').first.receptions_by_gender.to_a.to_json
  end
end