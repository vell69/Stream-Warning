local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Trove = require(ReplicatedStorage.Packages.Trove)

local PlayerClass = {}
PlayerClass.__index = PlayerClass

export type PlayerObject = typeof(setmetatable(
	{} :: {
		trove: typeof(Trove.new()),
		player: Player,
	},
	PlayerClass
))

function PlayerClass.new(player: Player): PlayerObject
	local self = setmetatable({}, PlayerClass)
	self.trove = Trove.new()
	self.player = player

	return self
end

function PlayerClass:destroy()
	print(self.player)
	self.trove:Destroy()
end

return PlayerClass
