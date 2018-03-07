defmodule BakamangaWeb.RegisterController do
  use BakamangaWeb, :controller
  alias Bakamanga.Accounts
  alias Bakamanga.Accounts.User

  def new(conn, _params) do
    chset = Accounts.change_user(%User{})
    render conn, "new.html", chset: chset
  end

  def create(conn, params) do
    case Accounts.create_user(params["register"]) do
      {:ok, _} ->
        conn
        |> put_flash(:success, gettext("Successfully create an account!"))
        |> redirect(to: page_path(conn, :index))
      {:error, chset} ->
        render conn, "new.html", chset: chset
    end
  end
end
