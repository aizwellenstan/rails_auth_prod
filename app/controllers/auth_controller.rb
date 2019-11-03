class AuthController < ApplicationController
    def login
        user = User.find_by(username: params[:username])
        is_authenticated = user.authenticate(params[:password])

        if is_authenticated
            payload =  { user_id: user.id }

            token = JWT.encode payload, 'wtf', 'HS256'

            render json: { token: token }
        else
            render json: { error: "Wrong username and/or password." }
        end
    end
end
