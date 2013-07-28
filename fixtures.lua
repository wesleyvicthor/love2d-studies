function love.load()
    local earthGravity = 9.8;

    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()

    world = love.physics.newWorld(0, earthGravity, true)

    body = love.physics.newBody(world, screenWidth/2, screenHeight/2, 'dynamic')
    bodyShape = love.physics.newRectangleShape(20, 20)
    bodyFixture = love.physics.newFixture(body, bodyShape, 1)

    body1 = love.physics.newBody(world, screenWidth/2 + 20, screenHeight/2 + 20, 'dynamic')
    body1Shape = love.physics.newRectangleShape(20, 20)
    body1Fixture = love.physics.newFixture(body1, body1Shape, 1)

    body2 = love.physics.newBody(world, screenWidth/2 + 10, screenHeight/2 + 10, 'dynamic')
    body2Shape = love.physics.newRectangleShape(20, 20)
    body2Fixture = love.physics.newFixture(body2, body2Shape, 1)

    floor = love.physics.newBody(world, screenWidth/2, (screenHeight/2) + 100, "static")
    floorShape = love.physics.newRectangleShape(screenWidth, 20)
    love.physics.newFixture(floor, floorShape, 1)

    bodyFixture:setFriction(1)
    body1Fixture:setFriction(1)
    body2Fixture:setFriction(1)

    bodyFixture:setRestitution(1)
    body1Fixture:setRestitution(1)
    body2Fixture:setRestitution(1)

    -- on set density to a fixture we must to reset its mass.
end

function love.update(dt)
    world:update(dt)
end

function love.draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.polygon('line', body:getWorldPoints(bodyShape:getPoints()))

    love.graphics.setColor(255, 222, 155)
    love.graphics.polygon('line', body1:getWorldPoints(body1Shape:getPoints()))

    love.graphics.setColor(222, 144, 255)
    love.graphics.polygon('line', body2:getWorldPoints(body2Shape:getPoints()))

    love.graphics.setColor(200, 220, 140)
    love.graphics.polygon('fill', floor:getWorldPoints(floorShape:getPoints()))
end 

function love.keypressed(key)
    if key == "q" then
        os.exit(0)
    end
end