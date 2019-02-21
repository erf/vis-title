function setTitle (title)
	vis:command(string.format(":!echo -ne '\\033]0;%s\\007'", title))
end

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	setTitle(win.file.name or '[No Name]')
end)

vis.events.subscribe(vis.events.FILE_SAVE_POST, function(file, path)
	setTitle(file.name)
end)
