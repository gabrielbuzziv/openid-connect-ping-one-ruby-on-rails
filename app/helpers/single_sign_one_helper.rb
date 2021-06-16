module SingleSignOneHelper

    def client
      @client ||= OpenIDConnect::Client.new(
        identifier: ENV['PINGONE_CLIENT_ID'],
        secret: ENV['PINGONE_CLIENT_SECRET'],
        redirect_uri: ENV['PINGONE_REDIRECT_URI'],
        host: ENV['PINGONE_ISSUER'],
        authorization_endpoint: '/as/authorization.oauth2',
        token_endpoint: '/as/token.oauth2',
        userinfo_endpoint: '/idp/userinfo.openid'
      )
    end
  

    def authorization_uri    
      client.authorization_uri(
          scope: 'openid profile email groups advprofile',
          response_mode: 'query',
          redirect_uri: ENV['PINGONE_REDIRECT_URI']
      )
    end

    def getUserInfo(access_token)
      access_token = OpenIDConnect::AccessToken.new(
          access_token: access_token,
          client: client
      )

      userInfo = access_token.userinfo!
    end

end