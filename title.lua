function setTitle (title)
	vis:command(string.format(":!echo -ne '\\033]0;%s\\007'", title))
end

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    local name = win.file.name
	if name == nil then name = '[No Name]' end
	setTitle(name)
end)

vis.events.subscribe(vis.events.FILE_SAVE_POST, function(file, path)
	setTitle(file.name)
end)
