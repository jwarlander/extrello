defmodule ExTrelloTest do
  use ExUnit.Case

  test "getting a public board" do
    client = ExTrello.Client.new(api_key: nil)
    {:ok, board} = ExTrello.Board.get(client, "4d5ea62fd76aa1136000000c")

    assert board.name == "Trello Development"
  end
  
end
