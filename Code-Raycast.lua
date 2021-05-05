--Raycast Hitbox--
--Made by Wolfy#9349--
--Version: 1.0.5--

local Hitbox = {}
Hitbox.__index = Hitbox

local RayParams = RaycastParams.new()
RayParams.FilterType = Enum.RaycastFilterType.Blacklist

function Hitbox:Init()
	self.connect = game:GetService("RunService").Heartbeat:Connect(function()
		RayParams.FilterDescendantsInstances = self.Filter
		for index, info in ipairs(self.FirstPoint) do
			--RayCast--
			local EndPoint = self.EndPoint[index].WorldPosition
			local result = workspace:Raycast(info, (EndPoint - info).Unit *
				(info - EndPoint).Magnitude, RayParams)
			if result then
				if result.Instance.Parent:FindFirstChild("Humanoid") then
					self.Callback(result.Instance.Parent)
					self:Remove()
					return
				end
			end
		end
	end)
end

function Hitbox:Cast(filter, callback)
	local Filter = self.Filter
	self.Callback = callback

	for _, value in ipairs(filter) do
		if value then
			table.insert(Filter, filter)
		end
	end
end

function Hitbox:Stop()
	if self.connect then
		self.connect:Disconnect()
	end
end

function Hitbox:Remove()
	self.EndPoint = {}
	self.FirstPoint = {}
	self.Filter = {}

	self:Stop()

	for index, value in pairs(self) do
		self[index] = nil
	end
end

return function(Part)
	local LastPositions = {}
	local CurrentPosition = {}
	local filter = {}

	for _, Info in pairs(Part:GetChildren()) do
		if Info and Info.ClassName == "Attachment" then
			table.insert(CurrentPosition, Info.WorldPosition)
			table.insert(LastPositions, Info)
			table.insert(filter, Info)
		end
	end
	
	table.insert(filter, Part)
	return setmetatable({
		part = Part, 
		Filter = filter, 
		FirstPoint = CurrentPosition, 
		EndPoint = LastPositions
	}, Hitbox)
end
