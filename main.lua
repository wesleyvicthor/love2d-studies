function love.load()
    local earthGravity = 9.8;

    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()

    world = love.physics.newWorld(0, earthGravity, true)

    player = {}
    player.state = 'STOP'
    player.body = love.physics.newBody(world, screenWidth/2 + 20, screenHeight/2 + 20, 'dynamic')
    player.shape = love.physics.newRectangleShape(20, 20)
    player.fixture = love.physics.newFixture(player.body, player.shape, 1)

    player.body:setFixedRotation(true)

    floor = love.physics.newBody(world, screenWidth/2, (screenHeight/2) + 100, "static")
    floorShape = love.physics.newRectangleShape(screenWidth, 1)
    love.physics.newFixture(floor, floorShape, 1)

    love.graphics.setBackgroundColor(61,61,61)
    desiredVel = 0
end

function love.update(dt)
    world:update(dt*10)

    if love.keyboard.isDown("right") then
        player.fixture:setFriction(2) 
        player.body:applyLinearImpulse(5, 0)
    elseif love.keyboard.isDown("left") then 
        player.fixture:setFriction(2) 
        player.body:applyLinearImpulse(-5, 0)
    elseif love.keyboard.isDown("up") then 
        player.fixture:setFriction(2) 
        player.body:applyLinearImpulse(0, 0)
    else
        
    end
end

function love.draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.polygon('fill', player.body:getWorldPoints(player.shape:getPoints()))

    love.graphics.setColor(000, 000, 000)
    love.graphics.polygon('fill', floor:getWorldPoints(floorShape:getPoints()))
end 

function love.keypressed(key)
    if key == "q" then
        os.exit(0)
    end

    if key == "i" then 
        local impulse = player.body:getMass() * 40
        player.body:applyLinearImpulse(0, -impulse)
    end
end