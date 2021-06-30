class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def new
    
  end

  def show

  def create
    @dojo = Dojo.create(user_params)
    puts @dojo.errors.full_messages
    if @dojo.valid?
      flash[:notice] = "Dojo data has been added successfully"
    else
      flash[:alert] = @dojo.errors.full_messages
    end
      
    redirect_to "/dojos"
  end

  private
    def user_params
      params.require(:dojo).permit(:branch, :street, :city,:state)
    end
end
