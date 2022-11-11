require 'sidekiq/web'

Rails.application.routes.draw do
  get 'tweets/index'
  get 'tweets/create'
  get 'tweets/destroy'
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  resources :tweets, except: %i[edit update]
  root to: 'tweets#index'
end
