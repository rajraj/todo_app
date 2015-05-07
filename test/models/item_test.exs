defmodule TodoApp.ItemTest do
  use TodoApp.ModelCase

  alias TodoApp.Item

  @valid_attrs %{complete: true, description: "some content", position: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Item.changeset(%Item{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Item.changeset(%Item{}, @invalid_attrs)
    refute changeset.valid?
  end
end
