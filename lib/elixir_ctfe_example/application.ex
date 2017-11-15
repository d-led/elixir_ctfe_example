defmodule ElixirCtfeExample.Application do
  use Application

  defmodule Resource do
    def embed do
      filename = "priv/embed_this.txt"
      contents = File.read!(filename)

      IO.puts "==== Reading #{filename} at compile time ... #{contents}"

      # some parsing
      resource = contents |> String.split(";") |> Enum.join(", ")
      "<<< #{resource} >>>"
    end
  end

  # will be embedded at compile time
  def greeting, do: unquote(Resource.embed())

  # same, but inline
  @version %{revision: File.read!(".git/refs/heads/master") |> String.trim } |> IO.inspect

  defp hello_ctfe do
    IO.puts "==== This is printed at run time: #{greeting()}"
    IO.puts "==== This map was embedded at compile time: #{@version.revision}"
  end

  def start(_type, _args) do
    hello_ctfe()

    opts = [strategy: :one_for_one, name: ElixirCtfeExample.Supervisor]
    Supervisor.start_link([], opts)
  end
end
