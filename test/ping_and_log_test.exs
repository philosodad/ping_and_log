defmodule PingAndLogTest do
  use ExUnit.Case
  doctest PingAndLog

  setup do
    PingAndLog.start
    on_exit fn ->
      PingAndLog.stop
    end
    :ok
  end

  test "responds with Pong" do
    {:ok, response} = HTTPoison.get("localhost:26439/ping")
    assert response.status_code == 200
    assert response.body == "I say PONG"
  end
end
