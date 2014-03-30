{View} = require 'atom'

module.exports =
class RefactoringRubyView extends View
  @content: ->
    @div class: 'refactoring-ruby overlay from-top', =>
      @div "The RefactoringRuby package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "refactoring-ruby:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "RefactoringRubyView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
