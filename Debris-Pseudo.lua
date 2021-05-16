--Created by Wolfy#9349--
--Version 1.0.7
local ActiveDebris = {}

game:GetService("RunService").Stepped:Connect(function()
	for Key, Info in pairs(ActiveDebris) do
		if os.clock() < Key then continue end
		Info:Destroy()
		ActiveDebris[Key] = nil	
	end
end)

return ActiveDebris
