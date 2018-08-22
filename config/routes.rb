Rails.application.routes.draw do
    
    resources :articles
=begin
    get "/articles"
    post "/articles"
    delete "/articles/:id"
    get "/articles/:id"
    get "/articles/new"
    get "/articles/:id/edit"
    patch "/articles/:id"
    put "/articles/:id"
=end
  root 'articles#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
