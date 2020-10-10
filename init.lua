function set_title(title)
	vis:command(string.format(":!echo -ne '\\033]0;%s\\007'", title))
end

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command(":!echo -ne '\\033[22t'") -- xterm push title?
	set_title(string.gsub(win.file.name or '[No Name]', '.*/', ''))
end)

vis.events.subscribe(vis.events.WIN_CLOSE, function(win)
	vis:command(":!echo -ne '\\033[23t'") -- xterm pop title?
	--set_title('')
end)

vis.events.subscribe(vis.events.FILE_SAVE_POST, function(file, path)
	set_title(string.gsub(file.name, '.*/', ''))
end)
