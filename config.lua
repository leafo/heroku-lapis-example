local config
do
  local _obj_0 = require("lapis.config")
  config = _obj_0.config
end
return config("heroku", function()
  return port(os.getenv("PORT"))
end)
