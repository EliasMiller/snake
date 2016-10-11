exf = {}

function exf.empty() end

function love.load()
	love.load = exf.empty
	love.update = exf.empty
	love.draw = exf.empty
	love.keypressed = exf.empty
	love.keyreleased = exf.empty
	love.mousepressed = exf.empty
	love.mousereleased = exf.empty
	love.filesystem.load("mainmenu.lua")()
	love.load()
end

function love.update(dt)
end

function love.draw()
end
