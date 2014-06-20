class JobsController < ApplicationController

  def index
    @jobs = Job.all.order(created_at: :desc)
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
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

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(user_params)
      flash[:notice] = "Job updated"
      redirect_to job_path(@job)
    else
      flash[:notice] = "Could not be saved"
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] = "Job deleted"
    redirect_to jobs_path
  end

  private

  def user_params
    params.require(:job).permit(:title, :description, :company_id)
  end


end
