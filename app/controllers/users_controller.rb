class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show]
  
  def index
    
  end
  
  def show
    @user = User.find_by(id: params[:id])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end