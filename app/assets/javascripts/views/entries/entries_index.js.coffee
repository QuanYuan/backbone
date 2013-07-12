class Raff.Views.EntriesIndex extends Backbone.View

  template: JST['entries/index']

  events:
    'submit #new_entry': 'createEntry'
    'click #draw': 'drawWinner'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendEntry, this)



  render: ->

    $(@el).html(@template())
    @collection.each(@appendEntry)
    $('#createBookmark').hide()

    this



  drawWinner: (event) ->
    event.preventDefault()
    $('#createBookmark').show()

  createEntry: (event) ->
    event.preventDefault()
    #@collection.create( name: $('#new_entry_name').val(),address: $('#new_entry_address').val(), tags: $('#new_entry_tags').val())
    #$('#new_entry')[0].reset()
    attributes = name: $('#new_entry_name').val(),address: $('#new_entry_address').val(), tags: $('#new_entry_tags').val()
    @collection.create attributes,
      wait:true
      success: -> $('#new_entry')[0].reset()
      error: @handleError
    $('#createBookmark').hide()


  appendEntry: (entry) ->
    view = new Raff.Views.Entry(model:entry)
    $('#entries').append(view.render().el)


  handleError: (entry, response) ->
    if response.status == 422
      errors  = $.parseJSON(response.responseText).errors
      st=""
      for attribute, messages of errors
        st+="Error:"+"#{attribute} #{message}"+"\n" for message in messages
      alert st