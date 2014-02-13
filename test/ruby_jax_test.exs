defmodule RubyJaxTest do
  use ExUnit.Case

  setup do
    ListServer.start_link
    ListServer.clear
  end

  test :clear_list do
    assert ListServer.items == []
  end

  test :add_items_to_list do
    ListServer.add("books")
    assert ["books"] == ListServer.items
  end

  test :remove_items_from_list do
    ListServer.add("books")
    ListServer.add("magazines")
    ListServer.remove("books")
    assert ["magazines"] == ListServer.items
  end

end
