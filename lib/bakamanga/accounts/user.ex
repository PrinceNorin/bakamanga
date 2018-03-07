defmodule Bakamanga.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Bcrypt


  schema "users" do
    field :avatar, :string
    field :email, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :avatar])
    |> validate_required([:name, :email, :password])
    |> validate_confirmation(:password)
    |> unique_constraint(:name)
    |> unique_constraint(:email)
    |> put_hash_password()
  end

  defp put_hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = chset) do
    put_change(chset, :password, Bcrypt.hashpwsalt(password))
  end

  defp put_hash_password(chset), do: chset
end
