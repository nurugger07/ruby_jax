defmodule RubyJax.Supervisor do
  use Supervisor.Behaviour

  def start_link do
    result = {:ok, sup } = :supervisor.start_link(__MODULE__, [])
    start_workers(sup)
    result
  end

  def start_workers(sup) do
    {:ok, list_data } = :supervisor.start_child(sup, worker(ListData, []))

    :supervisor.start_child(sup, worker(RubyJax.SubSupervisor, [list_data]))
  end

  def init(list) do
    supervise [], strategy: :one_for_one
  end
end
