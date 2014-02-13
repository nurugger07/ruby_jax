defmodule ListServer do
  use GenServer.Behaviour

  # Public API
  def start_link(items\\[]) do
    { :ok, list } = :gen_server.start_link(__MODULE__, items, [])
    list
  end

  def add(list, item) do
    :gen_server.cast list, {:add, item}
  end

  def remove(list, item) do
    :gen_server.cast list, {:remove, item}
  end

  def items(list) do
    :gen_server.call list, :items
  end

  ### GenServer API
  def init(items) do
    {:ok, items}
  end

  def handle_cast(:clear, list) do
    {:noreply, []}
  end

  def handle_cast({:add, item}, list) do
    {:noreply, list ++ [item]}
  end

  def handle_cast({:remove, item}, list) do
    {:noreply, List.delete(list, item)}
  end

  def handle_call(:items, _from, list) do
    {:reply, list, list}
  end
end
