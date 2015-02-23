class UsersController <ApplicationController

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

private
  def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:user_name, :password, :about)
    end
end
