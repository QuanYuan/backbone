window.Raff =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    #alert 'Hello from Backbone!'
    new Raff.Routers.Entries()
    Backbone.history.start()

$(document).ready ->
  Raff.initialize()
