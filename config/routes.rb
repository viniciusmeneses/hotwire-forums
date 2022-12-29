Rails.application.routes.draw do
  devise_for :users

  resources :categories

  resources :discussions do
    resources :posts, only: %i[create show edit update destroy], module: :discussions
    resources :notifications, only: :create, module: :discussions

    collection do
      get "categories/:id", to: "categories/discussions#index", as: :category
    end
  end

  resources :notifications, only: :index do
    collection do
      post "mark_as_read", to: "notifications#read_all", as: :read
    end
  end

  unauthenticated do
    root to: "main#index", as: :unauthenticated_root
  end

  authenticated do
    root to: "discussions#index", as: :authenticated_root
  end
end
