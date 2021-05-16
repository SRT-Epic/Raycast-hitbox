--Created by Wolfy#9349--
--Version 1.0.3
local Active = {}

game:GetService("RunService").Stepped:Connect(function()
	for Key, Info in pairs(Active) do
		if os.clock() < Key then return end
		Info:Destroy()
		Active[Key] = nil
	end
end)

return Active
