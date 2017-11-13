defmodule ElixirCtfeExample.Application do
  use Application

  defmodule Resource do
    def embed do
      filename = "priv/embed_this.txt"
      IO.puts "==== Reading #{filename} at compile time ..."
      contents = File.read! filename
      "<<< #{contents} >>>"
    end
  end

  # will be embedded at compile time
  def greeting, do: unquote(Resource.embed())

  defp hello_ctfe do
    IO.puts "==== This is printed at run time: #{greeting()}"
  end

  def start(_type, _args) do
    hello_ctfe()

    opts = [strategy: :one_for_one, name: ElixirCtfeExample.Supervisor]
    Supervisor.start_link([], opts)
  end
end
