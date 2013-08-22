lapis = require "lapis"

import Model from require "lapis.db.model"

class Things extends Model

lapis.serve class extends lapis.Application
  "/": =>
    things = Things\select!

    @html ->
      div "Welcome to Lapis #{require "lapis.version"}!"
      ul ->
        for thing in *things
          li ->
            text "#{thing.id} - #{thing.name}"

  "/add/:name": =>
    thing = Things\create name: @params.name
    json: thing

