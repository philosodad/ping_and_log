defmodule Settings do
  import EnvHelper
  case Mix.env do
    :test -> 
      system_env(:port, 25425)
    :dev ->
      system_env(:port, 25525)
    :prod -> 
      system_env(:port, 25525, :string_to_integer)
  end
end
