local BlekLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/bleklib/main/library.lua"))()

local win = BlekLib:Create({
    Name = "Ultimate Trolling FE",
    StartupSound = {
        Toggle = true,
        SoundID = "rbxassetid://6958727243",
        TimePosition = 1
    }
})

-- sections

local FeInfo = win:Tab('Info')
local FeScript = win:Tab('Fe Scripts')
local FeTroll = win:Tab('Fe Trolling')
local FeScript = win:Tab('Fe Plus')

-- Info Tab Contents

local dropdown = main:Dropdown("Dropdown", {"a","b","c","d"},"", function(v)
    print(v)
end)


-- Fe Script Contents




-- Fe Trolling Contents