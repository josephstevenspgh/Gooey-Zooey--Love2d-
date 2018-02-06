function love.conf(t)


    t.modules.joystick = false          -- Enable the joystick module (boolean)
    --t.modules.keyboard = false          -- disable for android release
    t.modules.physics = false           -- Enable the physics module (boolean)


	t.window.width = 800
    t.window.height = 600
    t.window.minwidth = 800
    t.window.minheight = 600
    t.window.resizable = false
    t.window.title = "Gooey Zooey: Slime Farming"
    t.window.vsync = true
    --love-release
    t.releases = {
    title = "Gooey Zooey: Slime Farming",              -- The project title (string)
    package = "GooeyZooey",            -- The project command and package name (string)
    loveVersion = '0.10.0',        -- The project LÖVE version
    version = "0.10",            -- The project version
    author = "Joseph Stevens",             -- Your name (string)
    email = "joseph.stevens.pgh@gmail.com",              -- Your email (string)
    description = "Slime Zoo Management Game",        -- The project description (string)
    homepage = "twitter.com/splixel",           -- The project homepage (string)
    identifier = "gooeyzooey",         -- The project Uniform Type Identifier (string)
    releaseDirectory = "bin",   -- Where to store the project releases (string)
  }
end

