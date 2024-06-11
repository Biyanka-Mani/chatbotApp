class SessionsController < ApplicationController
    def new
    end
    def create
        user =User.find_by(username: params[:session][:username])
        if user&&user.authenticate(params[:session][:password])
            session[:user_id]=user.id
            flash[:success]="Login Successfully!"
            redirect_to root_path
        else
            flash.now[:error]="Login Failed!"
            render :new,status: :unprocessable_entity
        end
    end

    def destroy
        session[:user_id]=nil
        flash[:success]="Logout Successfully!"
        redirect_to login_path
    end
end
