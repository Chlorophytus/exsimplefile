# Exsimplefile

Elixir-based simple file server.

Saves to an S3 bucket.

## Register a user

```elixir
Exsimplefile.Accounts.register_user(%{username: "ExampleUser", password: "test_password"})
```

## Launch in development

```shell
$ CDN_URI="https://cdn.example.com/" AWS_REGION="aws-region" S3_BUCKET="bucket" AWS_ACCESS_KEY_ID="access-key-id" AWS_SECRET_ACCESS_KEY="secret-access-key" iex -S mix phx.server