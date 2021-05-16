--Created by Wolfy#9349--
--Version 1.0.0
local ActiveDebris = {}

game:GetService("RunService").Stepped:Connect(function()
	for Key, Info in pairs(ActiveDebris) do
		if os.clock() > Key then
			Info:Destroy()
			ActiveDebris[Key] = nil			
		end
	end
end)

return ActiveDebris
