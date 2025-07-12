# Exsimplefile

Elixir-based simple file server.

Saves to an S3 bucket.

## Register a user

```elixir
Exsimplefile.Accounts.register_user(%{username: "ExampleUser", password: "test_password"})
```