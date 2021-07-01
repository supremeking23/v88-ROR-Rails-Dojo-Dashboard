Rails.application.routes.draw do
  get 'dojos/index'
  get 'dojos/new'
  post 'dojos/create'
  get 'dojos' => 'dojos#index'
  get 'dojos/:id' => "dojos#show"
  
  # need in order
  get 'dojos/:id/students/new' => "dojos#new_student"
  post 'dojos/:id/students/create' => "dojos#create_student"
  get 'dojos/:id/students/:student_id' => "dojos#show_student"
  get 'dojos/:id/students/:student_id/edit' => "dojos#edit_student"
  patch 'dojos/:id/students/:student_id' => "dojos#update_student"
  delete 'dojos/:id/students/:student_id' => 'dojos#delete_student'

  get 'dojos/:id/edit' => 'dojos#edit'

  patch 'dojos/:id' => 'dojos#update'
  delete 'dojos/:id' => 'dojos#delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
