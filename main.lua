function love.load()
    local earthGravity = 9.8;

    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()

    world = love.physics.newWorld(0, earthGravity, true)
end

function love.update(dt)
    world:update(dt)
end

function love.draw()
    
end 

function love.keypressed(key)
    if key == "q" then
        os.exit(0)
    end
end