module.exports =
class RokuDeployView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('roku-deploy')
    # Create message element
    message = document.createElement('div')
    message.textContent = "Roku package deployed!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->
  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
