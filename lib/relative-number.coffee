module.exports =
	activate: (state) ->
		atom.workspace.eachEditor (editor) =>
			@subscribe editor

	deactivate: ->

	subscribe: (editor) ->
		editor.on 'cursor-moved', (event) =>
			current_line = event.newBufferPosition.row
			editorView = atom.workspaceView.getActiveView()
			gutter = editorView.gutter
			gutter.find('.line-number').each (index, element) ->
				line = parseInt element.dataset['bufferRow'], 10
				if not isNaN(line)
					element.textContent = Math.abs(current_line - line)
