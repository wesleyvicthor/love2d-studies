function love.load()
    local earthGravity = 9.8;

    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()

    world = love.physics.newWorld(0, earthGravity, true)

    body = love.physics.newBody(world, screenWidth/2, (screenHeight/2) - 100, 'dynamic')
    bodyShape = love.physics.newRectangleShape(20, 20)
    love.physics.newFixture(body, bodyShape, 1)

    staticBody = love.physics.newBody(world, screenWidth/2, screenHeight/2, 'static')
    staticBodyShape = love.physics.newRectangleShape(20, 20)
    love.physics.newFixture(staticBody, staticBodyShape)

    kinematicBody = love.physics.newBody(world, (screenWidth/2) + 2, (screenHeight/2) - 55, 'kinematic')
    kinematicBodyShape = love.physics.newRectangleShape(20, 20)
    love.physics.newFixture(kinematicBody, staticBodyShape)
end

function love.update(dt)
    world:update(dt)

    -- body:setAngularVelocity(-90*dt)
    kinematicBody:setAngularVelocity(180*dt)
end

function love.draw()
    love.graphics.setColor(100, 100, 100)
    love.graphics.polygon('line', staticBody:getWorldPoints(bodyShape:getPoints()))

    love.graphics.setColor(255, 255, 255)
    love.graphics.polygon('line', body:getWorldPoints(bodyShape:getPoints()))

    love.graphics.setColor(250, 250, 138)
    love.graphics.polygon('line', kinematicBody:getWorldPoints(kinematicBodyShape:getPoints()))

    love.graphics.print("static body: " .. staticBody:getPosition(), 20, 20)
    love.graphics.print("dynamic body: " .. body:getPosition(), 20, 40)
    love.graphics.print("kinematic body: " .. kinematicBody:getAngle(), 20, 60)
end 

function love.keypressed(key)
    if key == "q" then
        os.exit(0)
    end
end