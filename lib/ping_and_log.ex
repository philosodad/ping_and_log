defmodule PingAndLog do
  use Application

  def start( _type, _args ) do
    import Supervisor.Spec, warn: false
    children = [
      worker(PingAndLog.Server, [])
    ]
    opts = [strategy: :one_for_one, name: PingAndLog.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
