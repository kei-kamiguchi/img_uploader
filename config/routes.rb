Rails.application.routes.draw do
  root "feeds#index"
  resources :feeds do
    collection do
      post :confirm
    end
  end
end
