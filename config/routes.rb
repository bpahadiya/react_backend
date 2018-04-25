Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users , defaults: {format: :json} do
        post :login, on: :collection
        post :signup, on: :collection
      end
    end
  end
end
