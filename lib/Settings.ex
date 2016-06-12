defmodule Settings do
  import EnvHelper
  system_env(:port, 26439, :string_to_integer)
end
