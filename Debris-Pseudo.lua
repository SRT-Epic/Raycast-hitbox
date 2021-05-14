--Created by Wolfy#9349--
--Version 1.0.2
local Active = {}

game:GetService("RunService").Stepped:Connect(function()
	for Position, Info in ipairs(Active) do
		if os.clock() < Info[1] then return end
		Info[2]:Destroy()

		table.remove(Active, Position)
	end
end)

return function(Item, Time)
	if not Item then return end
	table.insert(Active, {os.clock() + Time, Item})
end
