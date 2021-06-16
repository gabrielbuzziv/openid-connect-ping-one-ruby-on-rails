Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/sso/redirect', to: 'single_sign_one#redirect', as: 'single_sign_one'
  get '/auth/v2/ping/callback', to: 'single_sign_one#callback', as: 'single_sign_one_callback'
end
