class UsersController < ApplicationController
    def index
      @users = User.all
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      if @user.update(user_params)
        redirect_to users_url, notice: "User was successfully updated."
      else
        render :edit
      end
    end
  
    private
  
    def user_params
      # params.require(:user).permit(*User::ROLES)
      params.require(:user).permit({role_ids: []})
    end
  end