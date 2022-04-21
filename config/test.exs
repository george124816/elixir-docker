import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :demo_app, DemoAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "2fsrYK5S/ROsSRAXe7Cn8TsB7wQvyI+6W37qyz0xf0LmDvSuZo3r/QGvawDfrSk4",
  server: false

# In test we don't send emails.
config :demo_app, DemoApp.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
