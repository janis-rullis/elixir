defmodule ElixirBackend.PageController do
  use ElixirBackend.Web, :controller

  def index(conn, _params) do
    exit 'Invalid request.';
  end
end
