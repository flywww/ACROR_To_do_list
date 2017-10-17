class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_url
  end

  def edit
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(task_params)

    redirect_to tasks_url
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url
  end

  def isOutOfDate
    @task = Task.find(params[:id])
    return (@task.due_date > Date.today)
  end

  private
  def task_params
   params.require(:task).permit(:name, :due_date, :note)
  end

end
