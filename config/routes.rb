Rails.application.routes.draw do
  devise_for :users
  root to: 'main#index'

  resources :discussions do
    resources :posts, only: [:create, :show, :edit, :update, :destroy], module: :discussions
  end
end
