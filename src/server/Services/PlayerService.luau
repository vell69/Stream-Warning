local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")

local PlayerClass = require(ServerScriptService.Server.Classes.Player)
local PlayerObjects = require(ServerScriptService.Server.Modules.PlayerObjects)

local PlayerService = {}

function PlayerService:Init()
	local function onPlayerAdded(player: Player)
		self:_playerAdded(player)
	end

	local function onPlayerRemoving(player: Player)
		self:_playerRemoving(player)
	end

	Players.PlayerAdded:Connect(onPlayerAdded)
	Players.PlayerRemoving:Connect(onPlayerRemoving)

	for _, player: Player in Players:GetPlayers() do
		task.spawn(onPlayerAdded, player)
	end
end

function PlayerService:_playerAdded(player: Player)
	local playerObject = PlayerClass.new(player)
	PlayerObjects[player] = playerObject

	local function onCharacterAdded(character: Model)
		character.Parent = workspace.Players
	end

	if player.Character then
		onCharacterAdded(player.Character)
	end

	player.CharacterAdded:Connect(onCharacterAdded)
end

function PlayerService:_playerRemoving(player: Player)
	if PlayerObjects[player] then
		PlayerObjects[player]:destroy()
		PlayerObjects[player] = nil
	end
end

return PlayerService
