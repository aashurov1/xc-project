class UsersController < ApplicationController

    before_action :set_session_flag!, except: [:create, :new]
    before_action :require_current_user!, except: [:create, :new]
    
    def create
        @user = Users.new(user_params)
        if @user.valid?
            @user.save!
            login!(@user)
            redirect_to root_url
        else 
            flash[:notice] = ["Username already exists"]
            redirect_to new_user_url
        end
    end

    def new 
        if !current_user.nil?
            redirect_to root_url
        else
            render 'users/new'
        end
    end

    def index
        render :show
    end

    def show
        @user = Users.find_by(params[:name])
        render :show
    end

    def update
        @user = Users.find(current_user.id)
        if @user.update_attributes(user_params)
            render "User data updated"
        else
            render "Issue updating user data"
        end
    end

    def user_params
        params.require(:user).permit(:name, :password, :username)
    end

end