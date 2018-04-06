Template = require '../templates/view'
DELAY = 5000

module.exports =
class RokuSearchView
  constructor: (targetConfig, defaultCallback) ->
    # Create root element
    @element = document.createElement 'div'
    # TODO: require html is giving errors, therefor the template is just an string
    # update this to require a real html fragment
    @element.innerHTML = Template
    @devices = @element.querySelector '[name]'
    @spinner = @element.querySelector '.loading'
    @actionButtons = @element.querySelector '[data-actions]'
    @targetConfig = targetConfig
    @defaultCallback = defaultCallback
    do @setup


  setup:(eventResponder = (e) -> console.log e) ->
    @devices.addEventListener 'change', eventResponder
    @actionButtons.addEventListener 'click', (e)=> @onClick e
    @setLoadingStatus


  onClick:(e)->
    button = e.target
    if button.matches('[data-confirm]')
      atom.config.set @targetConfig, @devices.value
      console.log atom.config.get @targetConfig
    do @defaultCallback


  setLoadingStatus: (visible = yes)->
    @spinner.style.visibility = if visible then 'visible' else 'hidden'


  # Tear down any state and detach
  destroy: ->
    do @element.remove


  getElement: ->
    @element


  addDevice:(device = { name : 'None' , ip : '' })->
    # receive device and create option element
    @devices.innerHTML += "<option value='#{device.ip}'>#{device.name}</option>"
    do @setLoadingStatus
    setTimeout ()=> @setLoadingStatus no, DELAY
