SampleApp::Application.routes.draw do

  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"

  root :to => 'static_pages#home'
  root :to => 'static_pages#help'
  root :to => 'static_pages#about'

end
