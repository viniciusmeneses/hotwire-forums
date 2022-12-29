Rails.application.routes.draw do
  devise_for :users

  resources :categories

  resources :discussions do
    resources :posts, only: [:create, :show, :edit, :update, :destroy], module: :discussions

    collection do
      get 'categories/:id', to: 'categories/discussions#index', as: :category
    end
  end

  unauthenticated do
    root to: 'main#index', as: :unauthenticated_root
  end

  authenticated do
    root to: 'discussions#index', as: :authenticated_root
  end
end
