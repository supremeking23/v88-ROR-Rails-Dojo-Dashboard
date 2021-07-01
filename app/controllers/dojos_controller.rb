class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def new
    
  end

  def show
    # fail
    @dojo = Dojo.find(params[:id])

    @students = @dojo.students
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
    @dojo = Dojo.find(params[:id])
    @dojo.update(dojo_params)
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
    @dojo = Dojo.create(dojo_params)
    puts @dojo.errors.full_messages
    if @dojo.valid?
      flash[:notice] = "Dojo data has been added successfully"
    else
      flash[:alert] = @dojo.errors.full_messages
    end
      
    redirect_to "/dojos"
  end


  # students

  def new_student
    @dojo = Dojo.find(params[:id])
    @dojos = Dojo.all
  end

  def show_student
    @dojo = Dojo.find(params[:id])
    @student = Student.find(params[:student_id])
    @students = @dojo.students.where.not(id: params[:student_id])
  
  end

  def edit_student
    @student = Student.find(params[:student_id])
    @dojos = Dojo.all
    @dojo = Dojo.find(params[:id])
  end

  def update_student
    # @dojo = Dojo.find(params[:id])
    # @dojo.update(dojo_params)
    # if @dojo.valid?
    #   flash[:notice] = "Dojo data has been updated successfully"
    # else
    #   flash[:alert] = @dojo.errors.full_messages
    # end
    # redirect_to "/dojos"
    
    @student = Student.find(params[:student_id])
    @student.update(student_params)
    if @student.valid?
      flash[:notice] = "Student data has been updated successfully"
    else
      flash[:alert] = @student.errors.full_messages
    end
     redirect_to "/dojos/#{params[:id]}"
  end

  def create_student
    @student = Student.create(student_params)
    
 
    if @student.valid?
      flash[:notice] = "Student data has been added successfully"
    else
      flash[:alert] = @student.errors.full_messages
    end
      
    redirect_to "/dojos/#{params[:id]}"
  end

  def delete_student
    student = Student.find(params[:student_id])
    student.destroy
    flash[:notice] = "Student data has been deleted successfully"
    redirect_to "/dojos/#{params[:id]}"
  end

  private
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city,:state)
    end

    def student_params
      params.require(:student).permit(:first_name, :last_name, :email,:dojo_id)
    end
end
