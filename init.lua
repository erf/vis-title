require('vis')

local function set_title(title)
	-- print() cannot be used here as it will mess up vis
	vis:command(string.format(":!printf '\\033]2;vis %s\\007'", title))
end

vis.events.subscribe(vis.events.INIT, function()
	print('\27[22;2t')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	set_title(win.file.name or '[No Name]')
end)

vis.events.subscribe(vis.events.FILE_SAVE_POST, function(file, path)
	set_title(file.name)
end)

vis.events.subscribe(vis.events.QUIT, function()
	print('\27[23;2t')
end)
