require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  resources :tweets, except: %i[edit update] do
    resources :comments, only: %i[create destroy]
    member do
      post :retweet
    end
  end
  resources :like, only: :create
  resources :profiles
  root to: 'tweets#index'
end
