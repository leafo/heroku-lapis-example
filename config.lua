local config
do
  local _obj_0 = require("lapis.config")
  config = _obj_0.config
end
return config("heroku", function()
  port(os.getenv("PORT"))
  return postgresql_url(os.getenv("HEROKU_POSTGRESQL_COPPER_URL"))
end)
