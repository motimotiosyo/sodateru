Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # 認証関連API
      post "auth/register", to: "auth#register"
      post "auth/login", to: "auth#login"
      get "auth/verify", to: "auth#verify"
      delete "auth/logout", to: "auth#logout"

      # タイムライン関連API
      resources :posts, only: [ :index, :create, :update, :destroy ]

      # 成長記録関連API
      resources :growth_records, only: [ :index, :show, :create, :update, :destroy ]

      # 植物関連API
      resources :plants, only: [ :index ]
    end

    get "health_check", to: "health_check#index"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
