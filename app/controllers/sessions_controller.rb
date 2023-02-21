class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by({"email" => params["email"]})
        # if user exists
        if @user
            if @user["password"] == params["password"]
            #if user's password matches
            # send them to companies
            flash["notice"] = "You logged in"    
            redirect_to "/companies"
            else
                flash["notice"] = "Wrong!"   
                redirect_to "/sessions/new"
            end       
        else
        # otherwise send them back to login
            @user = User.find_by({"email" => params["email"]})
            redirect_to "/sessions/new"
        end
    end
end
