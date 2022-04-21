class SessionsController < ApplicationController

    def create

        usr = params[:user][:username] 
        pwd = params[:user][:password]

        # we should check these for emptiness in FE before sending request

        if usr.length == 0 || pwd.length == 0
            flash[:notice] = ["Enter username / password"]
            redirect_to new_session_url
            return nil
        end

        user = Users.find_by_credentials(usr, pwd)
        
        if user.nil?
            flash[:notice] = ["Incorrect username / password"]
            redirect_to new_session_url #, notice: "Incorrect name / password"
        else 
            login!(user)
            # render '/users/show'
            redirect_to root_url
            # redirect_to user_url
        end
    end

    def new
        if current_user != nil
            redirect_to root_url
        end
    end

    def destroy
        if current_user
            @user = current_user
            logout!
            redirect_to new_session_url
        end
    end
end