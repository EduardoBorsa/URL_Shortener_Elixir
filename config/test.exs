import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :url_shortener, URLShortener.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "url_shortener_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

System.get_env("HOST_NAME") ||
  raise """
  environment variable HOST_NAME is missing.
  For example: SERVER_HOST=http://localhost:4000/
  Did you forgot to source the .env?
  """

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :url_shortener, URLShortenerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "OukOF7dJc/GTRZAM/D46NjCRzkL6PfSjM4he941bA7XPAad5+2JrdCgWA0p54nby",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
