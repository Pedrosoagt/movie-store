Rails.application.routes.draw do
  get 'hello' => 'hello#index'

  # Movies
  resources 'movies'

  # Actors
  resources 'actors'

end
