local STI = require("sti")
require("player")
require("coin")
require("gui")
love.graphics.setDefaultFilter("nearest", "nearest")

function love.load()
	Map = STI("map/1.lua", {"box2d"})
	World = love.physics.newWorld(0,0)
	World:setCallbacks(beginContact, endContact)
	Map:box2d_init(World)
	Map.layers.solid.visible = false
	background = love.graphics.newImage("assets/background.png")
	GUI:load()
	Player:load()
	Coin.new(300, 200)
	Coin.new(400, 200)
	Coin.new(500, 100)
end

function love.update(dt)
	World:update(dt)
	Player:update(dt)
	Coin.updateAll(dt)
	GUI:update(dt)
end

function love.draw()
	love.graphics.draw(background)
	Map:draw(0, 0, 2, 2)
	love.graphics.push()
	love.graphics.scale(2,2)

	Player:draw()
	Coin.drawAll()

	love.graphics.pop()
	GUI:draw()
end

function love.keypressed(key)
	Player:jump(key)
end

function beginContact(a, b, collision)
	if Coin.beginContact(a, b, collision) then return end
	Player:beginContact(a, b, collision)
end

function endContact(a, b, collision)
	Player:endContact(a, b, collision)
end
