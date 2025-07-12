defmodule Exsimplefile.Repo do
  use Ecto.Repo,
    otp_app: :exsimplefile,
    adapter: Ecto.Adapters.SQLite3
end
