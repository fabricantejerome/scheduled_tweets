class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            # Send email
            PasswordMailer.with(user: @user).reset.deliver_now
        end

        redirect_to root_path, notice: "If an account was found, we sent an email for password reset"
    end
end