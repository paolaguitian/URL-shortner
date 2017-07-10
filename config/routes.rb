Rails.application.routes.draw do
  resources :urls, only: [:create,:index]  #creates routes for all def
  root 'urls#index'
  get 'url/:new_url' => 'urls#show', as: :new_url

  #root -- home page
end
