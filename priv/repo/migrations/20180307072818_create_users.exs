defmodule Bakamanga.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :email, :string, null: false
      add :password, :string, null: false
      add :avatar, :string

      timestamps()
    end

    create index(:users, [:name], unique: true)
    create index(:users, [:email], unique: true)
  end
end
