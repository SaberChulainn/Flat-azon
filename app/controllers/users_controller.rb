class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
    end

    def update
    end

    private
    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :address, :profile_pic)
    end
end
