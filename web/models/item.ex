defmodule TodoApp.Item do
  use TodoApp.Web, :model

  schema "items" do
    field :description, :string
    field :position, :integer
    field :complete, :boolean, default: false

    timestamps
  end

  @required_fields ~w(description)
  @optional_fields ~w(position complete)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
