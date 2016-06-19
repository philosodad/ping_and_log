defmodule PingAndLogTest do
  use ExUnit.Case
  doctest PingAndLog

  test "responds with Pong" do
    {:ok, response} = HTTPoison.get("localhost:#{Settings.port}/ping")
    assert response.status_code == 200
    assert response.body == "pong"
  end

  test "returns 404 on not found" do
    {:ok, response} = HTTPoison.get("localhost:#{Settings.port}/notaroute")
    assert response.status_code == 404
  end
end
