defmodule Cards.Router do
  use Cards.Web, :router

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

  scope "/", Cards do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/topics/new", TopicController, :new
    post "/topics", TopicController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", Cards do
  #   pipe_through :api
  # end
end
