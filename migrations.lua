local create_table, types
do
  local _obj_0 = require("lapis.db.schema")
  create_table, types = _obj_0.create_table, _obj_0.types
end
return {
  function(self)
    return create_table("things", {
      {
        "id",
        types.serial
      },
      {
        "name",
        types.varchar
      },
      "PRIMARY KEY (id)"
    })
  end
}
