require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  member do
    post :retweet
  end

  devise_for :users
  resources :tweets, except: %i[edit update]
  resources :profiles
  root to: 'tweets#index'
end
