Rails.application.routes.draw do
	root 'users#new'
	resources :users
	resources :ideas

	post '/register' => 'users#create'
	post '/sessions' => 'sessions#create'
	post '/like/:id' => 'ideas#like'
	get '/likes/:id' => 'ideas#likes'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
