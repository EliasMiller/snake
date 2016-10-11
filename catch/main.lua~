local x, y, w, h, ox, oy, rdm, speed, image
collision, touching, counter, damage, level, speed = require("coll"), 0, 0, 0, 1, 30

function love.load()

--Loading Source

	bgm = love.audio.newSource("assets/sound/bgm.mp3", "stream")
	puc = love.audio.newSource("assets/sound/pickup.wav")
	dam = love.audio.newSource("assets/sound/damage.wav")
	go = love.audio.newSource("assets/sound/gameover.wav")
	font = love.graphics.newFont("assets/PressStart.ttf", 20)

--Create moving object

	mouse = {
		x = 240,
		y = 290,
		ox = 35,
		oy = 27.5,
		speed = 200,
		image = love.graphics.newImage("assets/pic/mouse.png"),
		w = 70,
		h = 55
	}
	coockie = {
		x = love.math.random(30, 330),
		y = 40,
		ox = 22.5,
		oy = 22.5,
		image = love.graphics.newImage("assets/pic/coockie.png"),
		w = 45,
		h = 45
	}
	cheezie = {
		x = love.math.random(30, 330),
		y = 40,
		ox = 20,
		oy = 22.5,
		image = love.graphics.newImage("assets/pic/cheezie.png"),
		w = 40,
		h = 45
	} 
	danger = {
		x = love.math.random(30, 330),
		y = 40,
		ox = 35,
		oy = 35,
		image = love.graphics.newImage("assets/pic/danger.png"),
		w = 65,
		h = 65
	}

--Create static object

	heart1 = {
		x = 400,
		y = 350,
		ox = 30,
		oy = 30,
		image = love.graphics.newImage("assets/pic/heart.png")
	}
	heart2 = {
		x = 435,
		y = 350,
		ox = 30,
		oy = 30,
		image = love.graphics.newImage("assets/pic/heart.png")
	}
	heart3  = {
		x = 470,
		y = 350,
		ox = 30,
		oy = 30,
		image = love.graphics.newImage("assets/pic/heart.png")
	}
	gameover = {
		x = 240,
		y = -180,
		ox = 100,
		oy = 68.5,
		image = love.graphics.newImage("assets/pic/gameover.png")
	}

end

function love.update(dt)

	rdm = love.math.random(30, 330)

	if coockie.x == cheezie.x then --Excludes the matching of coordinates on the x axis
		coockie.x = rdm 
	end

	if damage ~= 3 then

		love.audio.play(bgm)
		coockie.y = coockie.y + (speed * dt)
		cheezie.y = cheezie.y + (speed * dt)
		danger.y = danger.y + (speed * dt)

		if (coockie.y + coockie.oy) > 360 then
			coockie.x = rdm
			coockie.y = 40
		elseif collision:detect(coockie.x,coockie.y,coockie.w,coockie.h, mouse.x,mouse.y,mouse.w,mouse.h) then
			love.audio.play(puc)
			touching = touching + 1
			counter = counter + 1
			if touching % 10 == 0 then
				level = level + 1
				speed = speed + 20
			end
			if touching % 20 == 0 then
				mouse.speed = mouse.speed + 20
			end
			coockie.x = rdm
			coockie.y = 40
		end

		if (cheezie.y + cheezie.oy) > 360 then
			cheezie.x = rdm
			cheezie.y = 40
		elseif collision:detect(cheezie.x,cheezie.y,cheezie.w,cheezie.h, mouse.x,mouse.y,mouse.w,mouse.h) then
			love.audio.play(puc)
			touching = touching + 1
			counter = counter + 1
			if touching % 10 == 0 then
				level = level + 1
				speed = speed + 20
			end
			if touching % 20 == 0 then
				mouse.speed = mouse.speed + 20
			end
			cheezie.x = rdm
			cheezie.y = 40
		end

		if (danger.y + danger.oy) > 360 then
			danger.x = rdm
			danger.y = 40
		elseif collision:detect(danger.x,danger.y,danger.w,danger.h, mouse.x,mouse.y,mouse.w,mouse.h) then
			love.audio.play(dam)
			damage = damage + 1
			if damage == 1 then
				heart1.y = 400
			elseif damage == 2 then
				heart2.y = 400
			elseif damage == 3 then
				heart3.y = 400
				gameover.y = 180
				love.audio.play(go)
			end
			danger.x = rdm
			danger.y = 40
		end

		if love.keyboard.isDown("left") then
    		mouse.x = mouse.x - (mouse.speed * dt)
			if mouse.x + mouse.ox < 0 then
				mouse.x = 500
			end
	  	end

		if love.keyboard.isDown("right") then
	    	mouse.x = mouse.x + (mouse.speed * dt)
			if mouse.x - mouse.ox > 480 then
				mouse.x = -20
			end
		end

	elseif damage == 3 then
		--Stops moving object
		coockie.y = 0 - coockie.oy
		cheezie.y = 0 - cheezie.oy
		danger.y = 0 - danger.oy
		mouse.y = 360 + mouse.oy
		speed = 30
		love.audio.stop(bgm)
		love.timer.sleep(4)
		heart1.y, heart2.y, heart3.y = 350, 350, 350
		--Resets the value of the variable
		damage = 0
		counter = 0
		level = 1
		mouse.y = 290
		gameover.y = -180

	end

end

function love.draw()

	love.graphics.setFont(font)
	love.graphics.setBackgroundColor(150, 150, 255)
	love.graphics.print("score", 10, 340)
	love.graphics.print(counter, 120, 340)
	love.graphics.print("level", 160, 20)
	love.graphics.print(level, 270, 20)
	love.graphics.draw(coockie.image, coockie.x, coockie.y, r, sx, sy, coockie.ox, coockie.oy)
	love.graphics.draw(cheezie.image, cheezie.x, cheezie.y, r, sx, sy, cheezie.ox, cheezie.oy)
	love.graphics.draw(mouse.image, mouse.x, mouse.y, r, sx, sy, mouse.ox, mouse.oy)
	love.graphics.draw(danger.image, danger.x, danger.y, r, sx, sy, danger.ox, danger.oy)
	love.graphics.draw(heart3.image, heart3.x, heart3.y, r, sx, sy, heart3.ox, heart3.oy)
	love.graphics.draw(heart2.image, heart2.x, heart2.y, r, sx, sy, heart2.ox, heart2.oy)
	love.graphics.draw(heart1.image, heart1.x, heart1.y, r, sx, sy, heart1.ox, heart1.oy)
	love.graphics.draw(gameover.image, gameover.x, gameover.y, r, sx, sy, gameover.ox, gameover.oy)

end
