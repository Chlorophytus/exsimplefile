defmodule ExsimplefileWeb.UploadLive do
  use ExsimplefileWeb, :live_view

  @file_size_raw 25 * 1000 * 1000

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
      <.header class="text-center">
        Upload file
      </.header>
      <p class="text-center">Maximum file size is {@file_size}</p>
      <br />
      <form id="upload-form" class="text-center" phx-submit="upload-file" phx-change="validate">
        <.live_file_input class="text-center" upload={@uploads.file} />
      </form>
      <br />

      <progress class="bg-zinc-100 rounded-full w-full m-4" max="100" value={@progress}>
      </progress>
    </div>
    """
  end

  def handle_event("validate", _unsigned_params, socket) do
    {:noreply, socket}
  end

  def handle_event("upload-file", _unsigned_params, socket) do
    {:noreply, socket}
  end

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:uploaded_file, [])
     |> assign(:progress, 0)
     |> assign(:file_size, Number.SI.number_to_si(@file_size_raw, unit: "B", precision: 0))
     |> allow_upload(:file,
       accept: :any,
       max_file_size: @file_size_raw,
       progress: &handle_progress/3,
       auto_upload: true
     )}
  end

  # ===========================================================================
  defp handle_progress(:file, entry, socket) do
    {:noreply, socket |> assign(:progress, entry.progress)}
  end
end
