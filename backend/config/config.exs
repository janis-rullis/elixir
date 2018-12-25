# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :backend,
  ecto_repos: [Backend.Repo]

# Configures the endpoint
config :backend, BackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dLw5JFdRL/0tHoDFbk0383rHY96sp6HFR6iXZIvowLwo8LugrUPidYpM0VlRUbFL",
  render_errors: [view: BackendWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Backend.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Char used as separator between words.
config :slugger, separator_char: ?-

# Path to the file containing replacements.
config :slugger, replacement_file: "lib/replacements.exs"

config :backend, incremental_slug: %{from_field: :title, to_field: :uri}

config :incremental_slug, fields: %{from: :title, to: :uri}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
