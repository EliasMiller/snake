local a, b, c, d, e, f = 1, 1, love.math.random(1, 8), love.math.random(1, 8), 1, 4
local Y = {30, 90, 150, 210, 270, 330, 390, 450}
local X = {30, 90, 150, 210, 270, 330, 390, 450}
local snake = { }
local point = { }

function love.load()

	snakeImg = love.graphics.newImage("src/img/snake.png")

	for i = 1, 4 do
		point[i] = {
			a = 1,
			b = 1
		}
		snake[i] = {
			x = X[point[i].a],
			y = Y[point[i].b],
			ox = 30,
			oy = 30,
			image = snakeImg
		}
		for j = 1, 3 do
			if i > j then
				point[i].b = point[i].b + 1
				snake[i].y = Y[point[i].b]
			end
		end
	end

	apple = {
		x = X[c],
		y = Y[d],
		ox = 20,
		oy = 20,
		image = love.graphics.newImage("src/img/block.png")
	}

end

function love.update(dt)

	function inheritPos(m)
		for m = f, 2, -1 do
			point[m].a = point[m - 1].a
			point[m].b = point[m - 1].b
		end
	end

	function changePos(t)
		for t = 2, f do
			snake[t].x = X[point[t].a]
			snake[t].y = Y[point[t].b]
		end
	end

	if love.keyboard.isDown("up") then
		inheritPos()
		point[1].b = point[1].b - 1
		if point[1].b < 1 then
			point[1].b = 8
		end
		love.timer.sleep(0.2)
		snake[1].y = Y[point[1].b]
		changePos()
	end

    if love.keyboard.isDown("down") then
		inheritPos()
		point[1].b = point[1].b + 1
		if point[1].b > 8 then
			point[1].b = 1
		end
		love.timer.sleep(0.2)
		snake[1].y = Y[point[1].b]
		changePos()
	end

    if love.keyboard.isDown("left") then
		inheritPos()
		point[1].a = point[1].a - 1
		if point[1].a < 1 then
			point[1].a = 8
		end
		love.timer.sleep(0.2)
		snake[1].x = X[point[1].a]
		changePos()
	end

    if love.keyboard.isDown("right") then
		inheritPos()
		point[1].a = point[1].a + 1
		if point[1].a > 8 then
			point[1].a = 1
		end
		love.timer.sleep(0.2)
		snake[1].x = X[point[1].a]
		changePos()
    end

	if snake[1].y == apple.y and snake[1].x == apple.x then
		love.timer.sleep(0.1)
		c = love.math.random(1, 8)
		d = love.math.random(1, 8)
		apple.x = X[c]
		apple.y = Y[d]
		f = f + 1
		grow()
	end

	function grow()
		point[f] = {
			a = point[f - 1].a,
			b = point[f - 1].b
		}
		table.insert(point, point[f])
		snake[f] = {
			x = X[point[f].a],
			y = Y[point[f].b],
			ox = 30,
			oy = 30,
			image = snakeImg
		}
		table.insert(snake, snake[f])
	end

	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end

function love.draw()
	love.graphics.print(f, 300, 300)
	love.graphics.setBackgroundColor(55, 70, 150)
	for i = 1, f do 
		love.graphics.draw(snake[i].image, snake[i].x, snake[i].y, r, sx, sy, snake[i].ox, snake[i].oy)
	end
	love.graphics.draw(apple.image, apple.x, apple.y, r, sx, sy, apple.ox, apple.oy)
end
