defmodule ExTrello.Client do

  defstruct api_key: nil

  def new(api_key: api_key) do
    %__MODULE__{api_key: api_key}
  end

end
