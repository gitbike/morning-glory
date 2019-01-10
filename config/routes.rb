Rails.application.routes.draw do
  root 'top#index'
  get 'about', to: 'top#about', as: 'about'
  # get 'lesson/:action(/:name)', to: 'lesson'
  # get 'lesson/step1/:name', to: 'lesson#step1'
  get 'lesson/:action(/:name)' => 'lesson'

  resources :members
end
