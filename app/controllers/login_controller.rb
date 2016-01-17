class LoginController < ApplicationController

    def index

    end

    def login
        @user = User.koala(request.env['omniauth.auth']['credentials'])

        #redirect to survey#index
    end
end
