--Created by Wolfy#9349--
--Version 1.0.0

local Active = {}

game:GetService("RunService").Stepped:Connect(function()
	for Position, Info in pairs(Active) do
		if os.clock() - Info[1] < Info[3] then return end
		Info[2]:Destroy()
		
		table.remove(Active, Position)
	end
end)

return function(...)
	local Time = os.clock()
	table.insert(Active, {Time, ...})
end