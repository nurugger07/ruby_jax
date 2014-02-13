defmodule ListData do
  use GenServer.Behaviour

  def start_link do
    :gen_server.start_link(__MODULE__, [], [])
  end

  def save(pid, state) do
    :gen_server.cast pid, { :save, state }
  end

  def get(pid, state) do
    :gen_server.call pid, :get
  end

  def init(list) do
    { :ok, list }
  end

  def handle_call(:get, _from, current_state) do
    { :reply, current_state, current_state }
  end

  def handle_cast({ :save, new_state }, _current_state) do

  end

end
