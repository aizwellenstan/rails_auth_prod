class AuthController < ApplicationController
    def login
        user = User.find_by(username: params[:username])
        is_authenticated = user.authenticate(params[:password])

        if is_authenticated
            payload =  user_payload(user)

            render json: { token: encode_token(user_payload(user)) }
        else
            render json: { error: "Wrong username and/or password." }
        end
    end
end
