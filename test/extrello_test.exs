defmodule ExTrelloTest do
  use ExUnit.Case

  import Mock

  test "it is possible to mock HTTPoison calls" do
    with_mock HTTPoison, [get: fn(_url) -> nil end] do
      HTTPoison.get("http://www.example.com")

      assert called HTTPoison.get("http://www.example.com")
    end
  end

  test "a client has the API key" do
    client = ExTrello.Client.new(api_key: "TEST_KEY")

    assert client.api_key == "TEST_KEY"
  end

  test "getting a board" do
    with_mock HTTPoison, [get: fn(_url) -> nil end] do
      ExTrello.Client.new(api_key: "MY_KEY")
      |> ExTrello.Board.get("BOARD_ID")

      assert called HTTPoison.get("https://api.trello.com/1/boards/BOARD_ID?key=MY_KEY")
    end
  end
  
  test "getting another board" do
    with_mock HTTPoison, [get: fn(_url) -> nil end] do
      ExTrello.Client.new(api_key: "MY_OTHER_KEY")
      |> ExTrello.Board.get("ANOTHER_BOARD_ID")

      assert called HTTPoison.get("https://api.trello.com/1/boards/ANOTHER_BOARD_ID?key=MY_OTHER_KEY")
    end
  end
end
