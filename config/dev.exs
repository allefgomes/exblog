use Mix.Config

# Configure your database
config :blog, Blog.Repo,
  username: System.get_env("DB_USERNAME") || "pgdocker",
  password: System.get_env("DB_PASSWORD") || "pgdocker",
  database: "blog_dev",
  hostname: System.get_env("DB_HOST") || "localhost",
  port: System.get_env("DB_PORT") || 5432,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :blog, BlogWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

config :blog, BlogWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/blog_web/(live|views)/.*(ex)$",
      ~r"lib/blog_web/templates/.*(eex)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime
