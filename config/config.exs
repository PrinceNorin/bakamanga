# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bakamanga,
  ecto_repos: [Bakamanga.Repo]

# Configures the endpoint
config :bakamanga, BakamangaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VRJElXkbAPeE9b1e0EbaI/ZyH6G5jJSgDKYxzUa7vYnRTrGezEUMMWt0/aqHrz7m",
  render_errors: [view: BakamangaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Bakamanga.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Guardian configuration
config :bakamanga, BakamangaWeb.Guardian,
  issuer: "bakamanga",
  secret_key: "2h4rvwaJlccUD8mbZIVjhp2lkjIUeRuzxm+sbHEmAI3etT7VKYTKIx8OTXaTOPXx"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
