Rails.application.routes.draw do
	
  	devise_for :users, :controllers => { :sessions => "api/v1/sessions" }
	devise_scope :user do
  		namespace :api do
   		namespace :v1 do
      		resources :sessions
      		resources :posts
      		resources :job_applications
    	end
    end
  	end
end

