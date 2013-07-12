class Raff.Views.Filter extends Backbone.View
  template: JST['entries/filter']
  tagName: 'li'

  render: ->
    $(@el).html(@template(entries:@collection))
    this