class Raff.Views.EntriesIndex extends Backbone.View

  template: JST['entries/index']

  events:
    'submit #new_entry': 'createEntry'
    'click #draw': 'drawWinner'
    'click #deleteEntry':'deleteBookmark'
    'click #editEntry':'editBookmark'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendEntry, this)
    @collection.on('remove',@render,this)



  render: ->

    $(@el).html(@template())
    @collection.each(@appendEntry)
    $('#createBookmark').hide()

    this

  deleteBookmark: (event) ->
    event.preventDefault()
   # console.log(event.target.name);
    ind=event.target.name
    #console.log ind
    #console.log(@collection.get(ind))
    @collection.get(ind).destroy()


  editBookmark: (event) ->
    event.preventDefault()

    ind=event.target.name
    name=@collection.get(ind).get("name")
    address=@collection.get(ind).get("address")
    tags=@collection.get(ind).get("tags")
    #console.log(name)
    @collection.get(ind).destroy()
    $('#createBookmark').show()

    $('#new_entry_name').val(name)
    $('#new_entry_address').val(address)
    $('#new_entry_tags').val(tags)
    #@collection.get(ind).destroy()

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
      $('#createBookmark').show()
      errors  = $.parseJSON(response.responseText).errors
      st=""
      for attribute, messages of errors
        st+="Error:"+"#{attribute} #{message}"+"\n" for message in messages
      alert st
