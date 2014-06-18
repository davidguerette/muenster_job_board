class JobsController < ApplicationController

  def index
    @jobs = Job.all.order(created_at: :desc)
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.a
  end

  def create
    @job = Job.new(user_params)
    if @job.save
      flash[:notice] = 'Saved!'
      redirect_to job_path(@job)
    else
      flash[:notice] = 'Invalid input'
      render :new
    end
  end

  private

  def user_params
    params.require(:job).permit(:title, :description, :company_id)
  end


end
