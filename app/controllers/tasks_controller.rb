class TasksController < ApplicationController
  before_action :require_logged_in
  before_action :self_find, only: [:show,:edit,:update,:destroy]
  
  def index
    if logged_in?
      @tasks = current_user.tasks.order("created_at DESC")
    end
  end
  
  def show
  end
  
  def new
    @task=Task.new
  end
  
  def create
    @task=current_user.tasks.build(task_params)
    if @task.save
      redirect_to root_url
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      redirect_to root_url
    else
      render :edit
    end
  end
  
  def destroy
    if @task
      @task.destroy
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  private
  
  def self_find
    @task=current_user.tasks.find_by(id: params[:id])
    
    # @task = current_user.tasks.find_by(id: params[:id])
    # if (@task == nil)
    #   redirect_to root_url
    # end
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
