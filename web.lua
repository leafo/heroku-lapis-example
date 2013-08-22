local lapis = require("lapis")
local Model
do
  local _obj_0 = require("lapis.db.model")
  Model = _obj_0.Model
end
local Things
do
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "Things",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Things = _class_0
end
return lapis.serve((function()
  do
    local _parent_0 = lapis.Application
    local _base_0 = {
      ["/"] = function(self)
        local things = Things:select()
        return self:html(function()
          div("Welcome to Lapis " .. tostring(require("lapis.version")) .. "!")
          return ul(function()
            for _index_0 = 1, #things do
              local thing = things[_index_0]
              li(function()
                return text(tostring(thing.id) .. " - " .. tostring(thing.name))
              end)
            end
          end)
        end)
      end,
      ["/add/:name"] = function(self)
        local thing = Things:create({
          name = self.params.name
        })
        return {
          json = thing
        }
      end
    }
    _base_0.__index = _base_0
    setmetatable(_base_0, _parent_0.__base)
    local _class_0 = setmetatable({
      __init = function(self, ...)
        return _parent_0.__init(self, ...)
      end,
      __base = _base_0,
      __name = nil,
      __parent = _parent_0
    }, {
      __index = function(cls, name)
        local val = rawget(_base_0, name)
        if val == nil then
          return _parent_0[name]
        else
          return val
        end
      end,
      __call = function(cls, ...)
        local _self_0 = setmetatable({}, _base_0)
        cls.__init(_self_0, ...)
        return _self_0
      end
    })
    _base_0.__class = _class_0
    if _parent_0.__inherited then
      _parent_0.__inherited(_parent_0, _class_0)
    end
    return _class_0
  end
end)())
