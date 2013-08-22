
import config from require "lapis.config"

config "heroku", ->
  port os.getenv "PORT"
  -- postgresql_url os.getenv "HEROKU_POSTGRESQL_BLUE_URL"
