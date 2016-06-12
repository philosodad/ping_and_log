defmodule PingAndLog do
  use Plug.Router
  alias Plug.Adapters.Cowboy
  plug :match
  plug :dispatch

  def start( _type, _args ), do: start

  def start do
    Cowboy.http PingAndLog, []
  end

  def stop do
    Cowboy.shutdown PingAndLog.HTTP
  end

  get "/ping" do
    send_resp(conn, 200, "I say PONG")
  end

  get _ do
    send_resp(conn, 404, "Nothin' to see here")
  end
end
