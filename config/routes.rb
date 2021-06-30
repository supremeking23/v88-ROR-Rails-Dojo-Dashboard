Rails.application.routes.draw do
  get 'dojos/index'
  get 'dojos/new'
  post 'dojos/create'
  get 'dojos' => 'dojos#index'
  get 'dojos/:id' => "dojos#show"

  get 'dojos/:id/edit' => 'dojos#edit'

  patch 'dojos/:id' => 'dojos#update'
  delete 'dojos/:id' => 'dojos#delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
