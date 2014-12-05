defmodule ExTrello.Board do
  alias ExTrello.Client

  def get( %Client{api_key: key}, board ) do
    HTTPoison.get("https://api.trello.com/1/boards/#{board}?key=#{key}")
  end
end
