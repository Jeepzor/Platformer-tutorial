local STI = require("sti")

function love.load()
	Map = STI("map/1.lua", {"box2d"}) -- Load the our map file using the library STI
	World = love.physics.newWorld(0,0) -- Creates the physics-world (Box2d)
	Map:box2d_init(World) --STI loads our solid layer and creates it into the physics-world.
	Map.layers.solid.visible = false -- Hides the solid layer from drawing.
	background = love.graphics.newImage("assets/background.png") -- Load the background image
end

function love.update(dt)
	World:update(dt) --Updates the physical world so that objects can move.
end

function love.draw()
	love.graphics.draw(background) -- Draws the background image at 0,0
	Map:draw(0, 0, 2, 2) -- Draws the Map at 0,0 with a scale of 200%
	love.graphics.push() -- "Saves" the current state
	love.graphics.scale(2,2) --Scales everything to 200%
		--Anything drawn here will have 200% scale
	love.graphics.pop() -- Returns to the saved state, everything is back to 100% scale
end
