defmodule ExsimplefileWeb.ViewLive do
  use ExsimplefileWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
      <.header class="text-center">
        View files
      </.header>
      <p class="text-center">Nothing here.</p>
    </div>
    """
  end
end
