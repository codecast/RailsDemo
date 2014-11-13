class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # handle a success full save.
      flash[:success] = "欢迎来到我的第一个Rails项目"
      redirect_to @user
    else
      render 'new'
    end
  end

  #健壮参数
  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
