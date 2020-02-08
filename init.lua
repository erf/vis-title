function set_title(title)
	print(string.format('\27]0;%s\7', title))
end

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	print('\27[22t')
	set_title(win.file.name or '[No Name]')
end)

vis.events.subscribe(vis.events.WIN_CLOSE, function(win)
	print('\27[23t')
end)

vis.events.subscribe(vis.events.FILE_SAVE_POST, function(file, path)
	set_title(file.name)
end)
