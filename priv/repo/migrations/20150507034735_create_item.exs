defmodule TodoApp.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :description, :string
      add :position, :integer
      add :complete, :boolean, default: false

      timestamps
    end

  end
end
