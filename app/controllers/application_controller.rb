class ApplicationController < ActionController::Base
    # CELLL
    
    #is available on Views
    helper_method :current_user, :logged_in?

    def require_current_user!
        if current_user.nil?
            has_loaded_data = session[:has_loaded_data]
            if has_loaded_data == false 
                # load data to DB
                load_data_to_db
                session[:has_loaded_data] = true    
            end
            redirect_to new_session_url 
        end
    end

    def set_session_flag!
        session[:has_loaded_data] = false
    end

    def load_data_to_db
        data = CSV.parse(File.read("/mnt/c/Users/Anvar/projects/xc-project/storage/logindata.csv"), headers: true)
        for row in data
            row = row.to_hash
            user = Users.new
            enrich_user_data(user, row)
            if user.valid?
                if Users.find_by(username: user.username).nil?
                    user.save!
                end
            end
        end
    end

    def enrich_user_data(user, row)
        user.name = row["Name"] 
        user.username = row["Username"]   
        user.password_digest = user.get_password_digest(row["Password"])
        user.id = row["Id"]
    end

    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= Users.find_by(session_token: session[:session_token])
    end

    def ensure_logged_in
        render json: "Redirecting to login page" unless logged_in?
    #todo who is redirecting this?
    end

    def logged_in?
        #empty string is true in Ruby
        !!@current_user
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

    def logout!
        current_user.reset_session_token!
        @current_user = nil
        session[:session_token] = nil
    end
end