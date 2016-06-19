defmodule PingAndLog.Server do
  use Plug.Router
  alias Plug.Adapters.Cowboy
  plug :match
  plug :dispatch

  def start_link do
    Cowboy.http PingAndLog.Server, [], port: Settings.port
  end

  get "/ping" do
    send_resp(conn, 200, "pong")
  end

  get _ do
    send_resp(conn, 404, "Nothin' to see here")
  end
end
