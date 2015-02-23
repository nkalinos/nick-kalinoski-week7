class SessionsController < ApplicationController

 def new
   @user = User.new
 end

 def create
   @user = User.find_by(user_name: params[:user_name])
   if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id
     redirect_to root_path, notice: 'Welcome back!'
   else
     flash[:alert] = "Invalid email / password"
     render :new
   end
 end

 def destroy
   session.clear
   redirect_to root_path, notice: "Bye!"
 end

end
