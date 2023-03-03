local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()



local GUI = Mercury:Create{
    Name = "Mercury",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/RobloxWebhookz/Equinox-FE/"
}

-- start up

local Tab = GUI:Tab{
	Name = "Game"
	Icon = "rbxassetid://8569322835"
}

local Tab2= GUI:Tab2{
	Name = "Universal" 
	Icon = "rbxassetid://8569322835"
}
