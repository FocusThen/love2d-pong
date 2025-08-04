local push = require("libs/push")
Class = require("libs/class")

local game = require("src/game")

WINDOW_WIDTH = 1200
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	math.randomseed(os.time())
	love.window.setTitle("Pong")

	smallFont = love.graphics.newFont("font.ttf", 8)
	-- scoreFont = love.graphics.newFont("font.ttf", 32)
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true,
	})

	game:init()

	gameState = "start"
end

function love.update(dt)
	game:update(dt)
end

function love.draw()
	push:apply("start")
	game:draw()

	displayFPS()

	push:apply("end")
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end

	game:keypressed(key)
end

function displayFPS()
	love.graphics.setFont(smallFont)
	love.graphics.setColor(0, 255, 0, 255)
	love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 10, 10)
end
