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
  @resource Resource.embed()

  defp hello_ctfe do
    IO.puts "==== This is printed at run time: #{@resource}"
  end

  def start(_type, _args) do
    hello_ctfe()

    children = []

    opts = [strategy: :one_for_one, name: ElixirCtfeExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
