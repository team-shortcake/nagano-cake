Rails.application.routes.draw do
    root 'homes#top'
    get 'about' => 'homes#about'
  
  
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  get 'customers/show'
  get 'customers/edit'
  devise_for :admins, :controllers => {
    :registrations => 'admin/registrations',
    :sessions => 'admin/sessions',
    :passwords => 'admin/passwords'
  }
  
  devise_for :customers, :controllers => {
    :registrations => 'customers/registrations',
    :sessions => 'customers/sessions',
    :passwords => 'customers/passwords'
  }
  
  namespace :admin do
    resources :items, only:[:index,:show,:edit,:create,:updete] 
    resources :genres, only:[:index,:create,:edit,:update]
    resources :customers, only:[:index,:show,:edit,:create,:update]
    resources :orders, only:[:index,:show,:edit,:update]
    resources :order_items, only:[:update]
  end


  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only:[:index,:show]
    resources :cart_items, only:[:index,:edit,:update,:destroy]
    delete '/public/cart_items' => 'destroy_all'
    resources :orders, only:[:index,:show,:new,:create]
    resources :customers, only:[:show,:edit,:update,:destroy]
    get '/pubulic/customers/quit_confirmation' => 'quit_confirmation'
    patch '/pubilic/customers/quit' => 'quit'
    resources :items, only:[:index,:show]
  end
  
end
