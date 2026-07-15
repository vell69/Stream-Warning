local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataServiceTyped = require(ReplicatedStorage.Packages.DataServiceTyped)

return DataServiceTyped({
	template = {
		currency = 1,
		inventory = {
			apples = 3,
			oranges = 10,
		},
		settings = {
			music = true,
		},
	},
})
