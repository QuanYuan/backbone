class Raff.Routers.Entries extends Backbone.Router
  routes:
    '':'index'
    'entries/:id':'show'

  initialize: ->
    @collection = new Raff.Collections.Entries()
    @collection.fetch({reset:true})

  index: ->
    view = new Raff.Views.EntriesIndex(collection: @collection)
    $('#container').html(view.render().el)
  show: (id) ->
    alert "Entry #{id}"
