defmodule WormwoodParseError do
  @moduledoc """
  An exception that is raised when Wormwood gets a bad result from Absinthe's Parse phase.
  It should provide some useful information as to where the error lays in the document.
  """
  defexception [:path, :err, :line, :context]

  def message(exception) do
    context_info = if exception.context, do: "\nContext:\n#{exception.context}", else: ""

    "Absinthe couldn't parse the document at path #{exception.path} due to:
    #{exception.err}
    At Line: #{exception.line}#{context_info}
    (Be sure to check imported documents as well!)"
  end
end
