defmodule TodoApp.TodoChannel do
  use TodoApp.Web, :channel
  alias TodoApp.Item

  def join("to_dos", message, socket) do
    {:ok, socket}
  end

  defp atomize_keys(struct) do
    Enum.reduce struct, %{}, fn({k, v}, map) -> Map.put(map, String.to_atom(k), v) end
  end

  def event("item:create", %{"item" => item_params}, socket) do
    item = create_item(item_params)
    if item do
      item_html = Phoenix.View.render TodoApp.PageView, "_item.html", item: item
      broadcast socket, "item:create", %{item_html: item_html}
    end
    {:noreply, socket}
  end

  # def event("item:toggle", data, socket) do
  #   socket
  # end
  #
  # def event("item:update", data, socket) do
  #   socket
  # end
  #
  # def event("item:delete", data, socket) do
  #   socket
  # end
  #
  # def event("item:arrange", data, socket) do
  #   socket
  # end

  defp create_item(item_params) do
    item = Map.merge(%Item{}, atomize_keys(item_params))
    case Item.validate(item) do
      [] ->
        item = Repo.insert(item)
      errors ->
        nil
    end
  end

end
