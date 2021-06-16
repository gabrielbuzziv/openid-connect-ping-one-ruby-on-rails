class SingleSignOneController < ActionController::Base
    
    def callback
        code = params[:code]

        client = helpers.client

        client.authorization_code = code
        access_token = client.access_token!

        userInfo = helpers.getUserInfo(access_token)

        render :json => {
            access_token: code,
            userinfo: userInfo
        }
        
    end

    def redirect
        redirect_to helpers.authorization_uri
    end



    # Primeiro Ação:
    # - Entra no ENDPOINT de redirect > criou o meu cliente de conexão > montou a url de autorização

end
