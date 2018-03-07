defmodule BakamangaWeb.PageController do
  use BakamangaWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
