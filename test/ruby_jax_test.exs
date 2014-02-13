defmodule RubyJaxTest do
  use ExUnit.Case

  test :clear_list do
    list = ListServer.start_link
    assert ListServer.items(list) == []
  end

  test :add_items_to_list do
    list = ListServer.start_link
    ListServer.add(list, "books")
    assert ["books"] == ListServer.items(list)
  end

  test :remove_items_from_list do
    list = ListServer.start_link
    ListServer.add(list, "books")
    ListServer.add(list, "magazines")
    ListServer.remove(list, "books")
    assert ["magazines"] == ListServer.items(list)
  end

end
