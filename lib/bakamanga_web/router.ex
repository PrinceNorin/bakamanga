defmodule BakamangaWeb.Router do
  use BakamangaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BakamangaWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/register", RegisterController, :new
    post "/register", RegisterController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", BakamangaWeb do
  #   pipe_through :api
  # end
end
