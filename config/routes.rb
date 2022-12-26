Rails.application.routes.draw do
  devise_for :users
  root to: 'main#index'

  resources :discussions do
    resources :posts, only: [:create], module: :discussions
  end
end
