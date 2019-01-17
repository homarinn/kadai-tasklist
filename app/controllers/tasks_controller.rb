class TasksController < ApplicationController
  
  before_action :self_find, only: [:show,:edit,:update,:destroy]
  
  def index
    @tasks=Task.all
  end
  
  def show
  end
  
  def new
    @task=Task.new
  end
  
  def create
    @task=Task.new(task_params)
    if @task.save
      redirect_to tasks_url
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      redirect_to tasks_url
    else
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    redirect_to tasks_url
  end

  private
  
  def self_find
    @task=Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
