

GUI = {}

function GUI:load()
   self.coins = {}
   self.coins.img = love.graphics.newImage("assets/coin.png")
   self.coins.width = self.coins.img:getWidth()
   self.coins.height = self.coins.img:getHeight()
   self.coins.scale = 3
   self.coins.x = 50
   self.coins.y = 50
   self.font = love.graphics.newFont("assets/bit.ttf", 36)
end

function GUI:update(dt)

end

function GUI:draw()
   self:displayCoins()
   self:displayCoinText()
end

function GUI:displayCoins()
   love.graphics.setColor(0,0,0,0.5)
   love.graphics.draw(self.coins.img, self.coins.x + 2, self.coins.y + 2, 0, self.coins.scale, self.coins.scale)
   love.graphics.setColor(1,1,1,1)
   love.graphics.draw(self.coins.img, self.coins.x, self.coins.y, 0, self.coins.scale, self.coins.scale)
end

function GUI:displayCoinText()
   love.graphics.setFont(self.font)
   local x = self.coins.x + self.coins.width * self.coins.scale
   local y = self.coins.y + self.coins.height / 2 * self.coins.scale - self.font:getHeight() / 2
   love.graphics.setColor(0,0,0,0.5)
   love.graphics.print(" : "..Player.coins, x + 2, y + 2)
   love.graphics.setColor(1,1,1,1)
   love.graphics.print(" : "..Player.coins, x, y)
end
