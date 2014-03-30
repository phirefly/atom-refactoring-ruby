RefactoringRubyView = require './refactoring-ruby-view'

module.exports =
  refactoringRubyView: null

  activate: (state) ->
    atom.workspaceView.command "refactor-ruby:extract-method", => @extractMethod()

  extractMethod: ->
    editor = atom.workspace.activePaneItem
    selection = editor.getSelectedText()
    tabText = editor.getTabText()
    lineCount = editor.getLineCount()

    editor.cutSelectedText()
    originalCursorPosition = editor.getCursorBufferPosition()
    editor.moveCursorDown(lineCount)
    editor.insertNewline()
    editor.insertText("def ")
    methodCursorPosition = editor.getCursorBufferPosition()
    editor.insertNewline()
    editor.insertText(selection)
    editor.insertNewline()
    editor.insertText("end")
    editor.setCursorScreenPosition(originalCursorPosition)
    editor.addCursorAtBufferPosition(methodCursorPosition)
    editor.insertText("my_function")
    editor.selectToBeginningOfWord()
