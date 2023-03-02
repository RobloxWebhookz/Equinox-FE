-- stops the time







wait(0.3)
setting = settings().Network
local Effect = Instance.new("ColorCorrectionEffect")
Effect.Parent = game.Lighting
Effect.Saturation = -1
Effect.Brightness = 0
Effect.Contrast = 0


Effect.Enabled = false
function onKeyPress(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.RightControl then	
		
		Effect.Enabled = true
		setting.IncomingReplicationLag = 1000
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed * 3
		wait(3)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
		Effect.Enabled = false
	    setting.IncomingReplicationLag = 0
		
	end
end


-- slows particles

-- Define the keybind to slow down particles
local SLOW_DOWN_KEYCODE = Enum.KeyCode.F

-- Define the original and slowed down time scales
local originalTimeScales = {}
local slowedDownTimeScale = 0 -- 50% slower

-- Function to slow down all the emitters and fire
local function slowDownEmitters()
    -- Loop through all the emitters and fire and slow down their particles
    for emitter, originalTimeScale in pairs(originalTimeScales) do
        if emitter:IsA("ParticleEmitter") then
            emitter.TimeScale = slowedDownTimeScale
        elseif emitter:IsA("Fire") then
            emitter.Heat = originalTimeScale * slowedDownTimeScale
        end
    end
end

-- Function to restore the original time scales of all the emitters and fire
local function restoreEmitters()
    -- Loop through all the emitters and fire and restore their original time scales
    for emitter, originalTimeScale in pairs(originalTimeScales) do
        if emitter:IsA("ParticleEmitter") then
            emitter.TimeScale = originalTimeScale
        elseif emitter:IsA("Fire") then
            emitter.Heat = originalTimeScale
        end
    end
end

-- Search for all the particle emitters and fire in the game
local emitters = game.Workspace:GetDescendants()
for i, descendant in ipairs(emitters) do
    if descendant:IsA("ParticleEmitter") then
        -- Store the original time scale of the emitter
        originalTimeScales[descendant] = descendant.TimeScale
    elseif descendant:IsA("Fire") then
        -- Store the original intensity of the fire
        originalTimeScales[descendant] = descendant.Heat
    end
end

-- Connect a function to the keydown event to slow down the particles
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == SLOW_DOWN_KEYCODE then
        slowDownEmitters()
    end
end)

-- Connect a function to the keyup event to restore the original time scales
game:GetService("UserInputService").InputEnded:Connect(function(input, gameProcessed)
    if input.KeyCode == SLOW_DOWN_KEYCODE then
        restoreEmitters()
    end
end)

-- Recheck the objects to slow down every 30 seconds
while true do
    wait(30)
    
    -- Clear the original time scales table
    originalTimeScales = {}
    
    -- Search for all the particle emitters and fire in the game
    local emitters = game.Workspace:GetDescendants()
    for i, descendant in ipairs(emitters) do
        if descendant:IsA("ParticleEmitter") then
            -- Store the original time scale of the emitter
            originalTimeScales[descendant] = descendant.TimeScale
        elseif descendant:IsA("Fire") then
            -- Store the original intensity of the fire
            originalTimeScales[descendant] = descendant.Heat
        end
    end
    
    -- If the slow down key is currently held down, slow down the particles again
    if game:GetService("UserInputService"):IsKeyDown(SLOW_DOWN_KEYCODE) then
        slowDownEmitters()
    end
end

game:GetService("UserInputService").InputBegan:connect(onKeyPress)
