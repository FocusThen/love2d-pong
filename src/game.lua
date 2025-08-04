require("src.components.Ball")
require("src.components.Paddle")

Game = {}

function Game:init()
	player1 = Paddle(10, 30, 5, 20)
	player2 = Paddle(VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 30, 5, 20)

	ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
end

function Game:update(dt)
	if love.keyboard.isDown("w") then
		player1.dy = -PADDLE_SPEED
	elseif love.keyboard.isDown("s") then
		player1.dy = PADDLE_SPEED
	else
		player1.dy = 0
	end

	if love.keyboard.isDown("up") then
		player2.dy = -PADDLE_SPEED
	elseif love.keyboard.isDown("down") then
		player2.dy = PADDLE_SPEED
	else
		player2.dy = 0
	end

	if gameState == "play" then
		ball:update(dt)
	end

	player1:update(dt)
	player2:update(dt)
end

function Game:draw()
	love.graphics.clear(40 / 255, 45 / 255, 52 / 255, 255 / 255)

	love.graphics.setFont(smallFont)
	love.graphics.printf("Hello " .. gameState .. " World!", 0, 20, VIRTUAL_WIDTH, "center")

	player1:render()
	player2:render()
	ball:render()
end

function Game:keypressed(key)
	if key == "enter" or key == "return" then
		if gameState == "start" then
			gameState = "play"
		else
			gameState = "start"
			ball:reset()
		end
	end
end

return Game
