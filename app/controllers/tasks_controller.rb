class TasksController < ApplicationController
  #before_action :set_task, only: [:edit, :destroy, :create] 
  before_action :set_list 

  def new
    @task = @list.tasks.new 
  end

  def create
    @task = @list.tasks.new(task_params)
      if @task.save 
        redirect_to board_path(@list.board_id)
      else 
        render :new
      end 
  end 

  def edit

  end

  def update
    if @task.update(task_params)
      redirect_to board_path(params[board_id]) 
    else 
      render :edit
    end
  end 

  def destroy 
    @task = Task.find(params[:id])
    @task.destroy 
    redirect_to board_path(@list.board_id)
  end 

  private 

  def set_list
    @list = List.find(params[:list_id])
  end
  
  # def set_task
  #   @task = Task.find(params[:id])
  # end 

  def task_params
    params.require(:task).permit(:title, :description, :priority) 
  end 

end
