class SessionsController < ApplicationController


    # Create 'new' action for SessionsController
    def new
    end
  
    # Create 'create' action for SessionsController
    def create
        user = User.find_by_email(params[:email])

        # If user exists and password entered is correct
        if user && user.authenticate(params[:password])
    
          # Save user id as cookie so they stay logged in
          session[:user_id] = user.id
          redirect_to '/'
        else
      # If user's login doesn't work, send them back to the login form.
        redirect_to '/login'
        end
    end
  
    # Create 'destroy' action for SessionsController
    def destroy
         # Remove session cookie
    session[:user_id] = nil
    redirect_to '/login'
    end
  end