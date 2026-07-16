local Services = script.Services

for _, service: ModuleScript in Services:GetChildren() do
	local serviceName = service.Name
	local serviceModule = require(service)

	if typeof(serviceModule) == "table" and typeof(serviceModule.Init) == "function" then
		serviceModule:Init()
		print("Initialized service: " .. serviceName)
	else
		warn("Service '" .. serviceName .. "' does not have an Init function.")
	end
end
