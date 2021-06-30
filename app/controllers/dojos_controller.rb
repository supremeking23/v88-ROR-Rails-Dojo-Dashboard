class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def new
    
  end

  def show
    # fail
    @dojo = Dojo.find(params[:id])
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
    @dojo = Dojo.find(params[:id])
    @dojo.update(user_params)
    if @dojo.valid?
      flash[:notice] = "Dojo data has been updated successfully"
    else
      flash[:alert] = @dojo.errors.full_messages
    end
    redirect_to "/dojos"
  end

  def delete
    dojo = Dojo.find(params[:id])
    dojo.destroy
    flash[:notice] = "Dojo data has been deleted successfully"
    redirect_to "/dojos"
  end

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
