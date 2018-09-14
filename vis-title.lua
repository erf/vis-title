vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command(string.format(":!echo -ne '\\033]0;%s\\007'", win.file.name))
end)
