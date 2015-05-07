defmodule TodoApp.PageController do
  use TodoApp.Web, :controller
  alias TodoApp.Repo
  alias TodoApp.Item
  import Ecto.Query

  plug :action

  def index(conn, _params) do
    outstanding_items = Repo.all(Item
      |> where([item], item.complete == false)
      |> order_by([item], asc: item.position))

    completed_items = Repo.all(Item
      |> where([item], item.complete == true)
      |> order_by([item], asc: item.position))

    render conn, "index.html", outstanding_items: outstanding_items,
      completed_items: completed_items
  end
end
