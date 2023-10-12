defmodule Exzeitable.HTML.Helpers do
  @moduledoc "Helpers that are needed across multiple modules in the HTML context"

  alias Phoenix.HTML.Tag
  alias Exzeitable.Params

  @doc "Adds the target to an <a> when there is an id present in the params, for live component pages"
  @spec tag(any, atom, keyword | Params.t(), keyword) :: {:safe, iolist}
  def tag(body, :a, %Params{id: id}, opts) when is_binary(id) do
    opts
    |> Keyword.merge("phx-target": id)
    |> then(&tag(body, :a, &1))
  end

  def tag(body, tag, _params, opts) do
    tag(body, tag, opts)
  end

  @doc "Replacement for content_tag to make it easier to pipe HTML chunks into each other"
  def tag(body, tag, opts), do: Tag.content_tag(tag, body, opts)
end
