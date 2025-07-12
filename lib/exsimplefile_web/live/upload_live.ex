defmodule ExsimplefileWeb.UploadLive do
  use ExsimplefileWeb, :live_view

  @file_size_raw 10 * 1024 * 1024

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
      <.header class="text-center">
        Upload file
      </.header>
      <p class="text-center">Maximum file size is {@file_size}</p>
        <br>
      <form id="upload-form" class="text-center" phx-submit="save" phx-change="validate">
        <.live_file_input class="text-center" upload={@uploads.file} />
        <br>
        <button type="submit" class="rounded-full bg-zinc-300 p-3 m-4 w-full">Upload</button>
      </form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:uploaded_file, [])
     |> assign(:file_size, Number.SI.number_to_si(@file_size_raw, unit: "B", precision: 0))
     |> allow_upload(:file,
       accept: ~w(audio/* image/* video/*),
       max_file_size: @file_size_raw
     )}
  end
end
