defmodule TodoApp.Router do
  use TodoApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TodoApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  socket "/ws", TodoApp do
    channel "to_dos", TodoChannel
  end

  # Other scopes may use custom stacks.
  # scope "/api", TodoApp do
  #   pipe_through :api
  # end
end
