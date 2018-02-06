-- Gooey Zooey 
-- Inspired by and probably Made for ludum dare

-- made by setz | @splixel on twitter

--[[
	Game Concepts and shit

	Manage a slime zoo:
		Start with a set amount of Currency
		Buy new Slimes to increase your zoo's value
		Slimes generate currency from visitors over time
		Upgrade Pens to increase slime value multipliers
		Unlock higher tier Slimes at value threshholds, which have higher Currency and Value

		You have to click each pen to collect Currency
		Scrubs can be hired to collect Currency for you

		There's a catch: 
			Each new slime you buy is less efficient in it's pen
			Upgrade Pens to lessen the burden of having more slimes, but
			Pen Upgrades have increasingly diminished value, and cannot be sold
			You have a time limit in which you are supposed to get the maximum zoo value possible

			Player's dillema: find the best route in which to get maximum value while being timed.
]]

--start code

function love.load()
	--the usual setup
	require("setzlib")
	require("loader")
	HighScore = 0
	loadgame()
	newgame()
	tutorialtext = {}
	tutorialtext[1] = "Welcome to Gooey Zooey! Please skim over this quick bit of info, or feel free to mash mouseclicks to skip through it. Either way, clicking will advance to the next window, there are only a few."
	tutorialtext[2] = "The goal of the game is to amass as much value as you can. \n\nYou have one month (about 12 minutes realtime) to build yourself a nice slime zoo. In this prototype, you only get 6 pens, so use them wisely.\n\nYou'll have to first buy a pen, then create a slime to put in it. Then you can buy more of the same kind of slime to place in it, or upgrade the pen. Each slime you buy has diminishing returns for currency, but gives the same amount of value.\n\nUpgrading the pen increases the currency or value that each slime gives."
	tutorialtext[3] = "There are a few tiers of slimes you can buy, and you can pick from 6 types that give different modifiers to the slimes. You can't sell any slimes or pens so it's important to plan out what you want to do.\n\nOnce time runs out, you'll get to see what your score is compared to your high score, and have an option to try again (without seeing this text).\n\nKeep in mind this is an early prototype and balance is whack. If this game proves popular, I'll flesh it out a good deal more, but expect some updates anyway!"
end


function newgame()
   	love.graphics.setFont(font_classicvwf)

   	nextspriteid = 0

	gamestate_title = 0
	gamestate_ingame = 1
	gamestate_paused = 2
	gamestate_finished = 3

	gamestate = gamestate_ingame

	sidebar_empty = 0
	sidebar_buypen = 1
	sidebar_buyslime = 2
	sidebar_upgradepen = 3
	sidebar_examinepen = 4
	sidebar_state = sidebar_empty

	--slime AI states
	slimeai_state_idle = 0
	slimeai_state_hopinplace = 1
	slimeai_state_hopleft = 2
	slimeai_state_hopright = 3
	slimeai_state_blipblop = 4

	--number growth and modifiers
	slimecost_increase = 1.04

	pen_balance_currency = 0.05
	pen_balance_value = 0.05

	pen_currency_currency = 0.1
	pen_currency_value = 0

	pen_value_currency = 0
	pen_value_value = 0.1

	upgradecost_multiplier = 1.05

	--more sidebar shit
	sidebar_activepen = 1
	sidebar_slimetier = 1
	sidebar_slimetype = 1
	
	--screen size and scaling
	screen = {}
	scaleamount = 1
	screen.width = 800
	screen.height = 600
	if scaleamount % 1 == 0 then
		love.graphics.setDefaultFilter("nearest", "nearest", 1)
		--only nearest if even scaling
	end
	vidxoffset = 0
	vidyoffset = 0
	xoffset = 0
	yoffset = 0
	canvas = love.graphics.newCanvas(screen.width, screen.height)

	--temp controls

	buttons = {}
	collect_button = init_button("z", false, 100000000000)
	table.insert(buttons, collect_button)
	

	--game values
	FramesLeft = 2592000
	Currency = 100
	TotalValue = 0
	CurrencyPerFrame = 0

	--slime tiers
	slime = {}
	slime[1] = {}
	slime[1].name = "Slime"
	slime[1].description = "Not a warrior capable of fighting a dragon."
	slime[1].cost = 100
	slime[1].value = 100
	slime[1].currency = 1
	slime[1].art = gfx_slime1
	slime[1].bounds = {8, 8, 8, 8}

	slime[2] = {}
	slime[2].name = "Nerdy Slime"
	slime[2].description = "Just a regular slime that spent 8 hours straight rerolling its initial stats."
	slime[2].cost = 500
	slime[2].value = 500
	slime[2].currency = 10
	slime[2].art = gfx_slime2
	slime[2].bounds = {8, 8, 8, 8}

	slime[3] = {}
	slime[3].name = "Rubber Slime"
	slime[3].description = "Some rude people try blowing up the rubber slime like a balloon. Don't be a rude people."
	slime[3].cost = 1000
	slime[3].value = 1000
	slime[3].currency = 100
	slime[3].art = gfx_slime3
	slime[3].bounds = {8, 8, 8, 8}

	slime[4] = {}
	slime[4].name = "Miao Slime"
	slime[4].description = "It fits in the pen, it sits in the pen."
	slime[4].cost = 50000
	slime[4].value = 50000
	slime[4].currency = 1000
	slime[4].art = gfx_slime4
	slime[4].bounds = {8, 8, 8, 8}

	slime[5] = {}
	slime[5].name = "Grumpy Slime"
	slime[5].description = "Grumpy slime is not amused."
	slime[5].cost = 100000
	slime[5].value = 100000
	slime[5].currency = 10000
	slime[5].art = gfx_slime5
	slime[5].bounds = {8, 8, 8, 8}

	--slime types
	slimetype = {}
	slimetype[1] = {}
	slimetype[2] = {}
	slimetype[3] = {}
	slimetype[4] = {}
	slimetype[5] = {}
	slimetype[6] = {}
	slimetype[1].name = "Balanced" 	-- vanilla stats
	slimetype[1].description = "This is just a standard slime, nothing special about it."
	slimetype[1].color = {50, 100, 255, 255}
	slimetype[1].currency = 1
	slimetype[1].value = 1
	slimetype[1].penalty = .925
	slimetype[2].name = "Rich"		-- +currency -value
	slimetype[2].description = "This slime is less valuable, but generates more currency."
	slimetype[2].color = {100, 255, 50, 255}
	slimetype[2].currency = 1.3
	slimetype[2].value = 0.7
	slimetype[2].penalty = .925
	slimetype[3].name = "Shiny"		-- -currency +value
	slimetype[3].description = "This slime is more valuable, but generates less currency."
	slimetype[3].color = {255, 50, 80, 255}
	slimetype[3].currency = 0.7
	slimetype[3].value = 1.3
	slimetype[3].penalty = .925
	slimetype[4].name = "Petite" 	-- -currency -value reduce penalty for population
	slimetype[4].description = "The penalty for each slime will be slightly reduced due to how dang cute they are, but they generate less currency, and are worth less value."
	slimetype[4].color = {255, 255, 150, 255}
	slimetype[4].currency = 0.8
	slimetype[4].value = 0.8
	slimetype[4].penalty = .985
	slimetype[5].name = "Brawny"	-- +currency +value increase penalty for population
	slimetype[5].description = "These slimes are huge, they're worth more value, and generate more currency, but the penalty for each slime will be increased."
	slimetype[5].color = {150, 50, 90, 255}
	slimetype[5].currency = 1.2
	slimetype[5].value = 1.2
	slimetype[5].penalty = .825
	slimetype[6].name = "Preppy"	-- -currency -value other pens have reduced penalty for population
	slimetype[6].description = "These slimes generate tons of currency, but are almost completely worthless."
	slimetype[6].color = {255, 255, 50, 255}
	slimetype[6].currency = 1.8
	slimetype[6].value = 0.2
	slimetype[6].penalty = .925

	pen = {}
	pen[1] = generatePen()
	pen[2] = generatePen()
	pen[3] = generatePen()
	pen[4] = generatePen()
	pen[5] = generatePen()
	pen[6] = generatePen()

	pen[1].pencost = 1000
	pen[4].pencost = 5000
	pen[2].pencost = 10000
	pen[5].pencost = 500000
	pen[3].pencost = 1000000
	pen[6].pencost = 50000000

	pen[1].upgradecost = 100
	pen[4].upgradecost = 500
	pen[2].upgradecost = 1000
	pen[5].upgradecost = 50000
	pen[3].upgradecost = 100000
	pen[6].upgradecost = 5000000

	--start with an empty pen
	pen[1].level = 1


	--clickable thins in the game
	penbutton1 = {}
	for i=1,3 do
		penbutton1[i] = {}
		penbutton1[i].x = 162
		penbutton1[i].y = 190*i-116
		penbutton1[i].w = 88
		penbutton1[i].h = 16
		penbutton1[i+3] = {}
		penbutton1[i+3].x = 432
		penbutton1[i+3].y = 190*i-116
		penbutton1[i+3].w = 88
		penbutton1[i+3].h = 16
	end
	penbutton2 = {}
	for i=1,3 do
		penbutton2[i] = {}
		penbutton2[i].x = 162
		penbutton2[i].y = 190*i-92
		penbutton2[i].w = 88
		penbutton2[i].h = 16
		penbutton2[i+3] = {}
		penbutton2[i+3].x = 432
		penbutton2[i+3].y = 190*i-92
		penbutton2[i+3].w = 88
		penbutton2[i+3].h = 16
	end

	--left/right for slime tier and type
	slimetier_left = {}
	slimetier_left.x = 560
	slimetier_left.y = 250
	slimetier_left.w = 50
	slimetier_left.h = 20
	slimetier_right = {}
	slimetier_right.x = 740
	slimetier_right.y = 250
	slimetier_right.w = 50
	slimetier_right.h = 20
	slimetype_left = {}
	slimetype_left.x = 560
	slimetype_left.y = 330
	slimetype_left.w = 50
	slimetype_left.h = 20
	slimetype_right = {}
	slimetype_right.x = 740
	slimetype_right.y = 330
	slimetype_right.w = 50
	slimetype_right.h = 20
	button_setpenslime = {}
	button_setpenslime.x = 620
	button_setpenslime.y = 430
	button_setpenslime.w = 100
	button_setpenslime.h = 30

	--pen upgrade buttons
	penupgrade_balance = {}
	penupgrade_balance.x = 560
	penupgrade_balance.y = 320
	penupgrade_balance.w = 230
	penupgrade_balance.h = 16
	penupgrade_currency = {}
	penupgrade_currency.x = 560
	penupgrade_currency.y = 340
	penupgrade_currency.w = 230
	penupgrade_currency.h = 16
	penupgrade_value = {}
	penupgrade_value.x = 560
	penupgrade_value.y = 360
	penupgrade_value.w = 230
	penupgrade_value.h = 16	

	--play again button
	playagain_button = {}
	playagain_button.x = 800/2-100
	playagain_button.y = 300
	playagain_button.w = 200
	playagain_button.h = 50


	--pen click areas
	slimebox = {}
	slimebox[1] = generateslimebox(10, 50)
	slimebox[2] = generateslimebox(10, 240)
	slimebox[3] = generateslimebox(10, 430)
	slimebox[4] = generateslimebox(280, 50)
	slimebox[5] = generateslimebox(280, 240)
	slimebox[6] = generateslimebox(280, 430)
end

function generateslimebox(x, y)
	retval = {}
	retval.x = x
	retval.y = y
	retval.w = 250
	retval.h = 160
	return retval
end

function generatePen()
	retval = {}
	retval.name = "Empty Pen"
	retval.description = "Put a slime in me!"
	retval.upgradecost = 1000
	retval.level = 0
	retval.modifier = 0
	retval.slimetier = 1
	retval.slimetype = 1
	retval.slimecost = 0
	retval.accumulatedCurrency = 0
	retval.population = 0
	retval.containedSprites = {}
	retval.balancelevel = 0
	retval.currencylevel = 0
	retval.valuelevel = 0
	return retval
end

function love.update(dt)
	if gamestate == gamestate_title then
	elseif gamestate == gamestate_ingame then
		FramesLeft = FramesLeft - 60
		if FramesLeft < 1 then
			if TotalValue > HighScore then
				HighScore = TotalValue
				savegame()
			end
			gamestate = gamestate_finished
		end
		--convert to Y:M:D:S where each s is a frame and there are 30 days in a month
		local FL = FramesLeft
		local DaysLeft = math.floor(FL / (60*60*24))
		FL = FL - DaysLeft * 60*60*24
		local HoursLeft = math.floor(FL / (60*60))
		FL = FL - HoursLeft * 60*60
		local MinutesLeft = math.floor(FL/60)
		if HoursLeft < 10 then
			HoursLeft = "0"..HoursLeft
		end
		if MinutesLeft < 10 then
			MinutesLeft = "0"..MinutesLeft
		end
		--DisplayTime_Big = os.date("%d days - %Hh %Mm", FramesLeft)
		DisplayTime_Big = DaysLeft.." days - "..HoursLeft.."h "..MinutesLeft.."m"
		control_mechanics()

		CalculateValue()
		for i=1,6 do
			if pen[i].population > 0 then
				local penmodifier = 1
				if pen[i].balancelevel > 0 then
					penmodifier = penmodifier + pen[i].balancelevel * pen_balance_currency
				end
				if pen[i].currencylevel > 0 then
					penmodifier = penmodifier + pen[i].currencylevel * pen_currency_currency
				end
				if pen[i].valuelevel > 0 then
					penmodifier = penmodifier + pen[i].valuelevel * pen_value_currency
				end
				pen[i].accumulatedCurrency = pen[i].accumulatedCurrency + ( (slime[pen[i].slimetier].currency * slimetype[pen[i].slimetype].currency * penmodifier) * (pen[i].population ^ slimetype[pen[i].slimetype].penalty))
				if collect_button.justpressed then
					Currency = Currency + pen[1].accumulatedCurrency
					pen[i].accumulatedCurrency = 0
				end
			end
		end
	elseif gamestate == gamestate_paused then
	elseif gamestate == gamestate_finished then
	end
end

function love.draw()
	love.graphics.setCanvas(canvas)
	setcolor(0, 0, 0)
	love.graphics.rectangle("fill", 0, 0, 1000, 1000)
	setcolorwhite()
	love.graphics.draw(gfx_gamebg)

	if gamestate == gamestate_title then
	elseif gamestate == gamestate_ingame then
		draw_ingame()
	elseif gamestate == gamestate_paused then
		draw_ingame()
		setcolor(0, 0, 0, 100)
		love.graphics.rectangle("fill", 0, 0, 1000, 1000)
		setcolorwhite()
		cprint("paused", 0, 200, 800)
	elseif gamestate == gamestate_finished then
		draw_ingame()
		setcolor(0, 0, 0, 100)
		love.graphics.rectangle("fill", 0, 0, 1000, 1000)
		setcolorwhite()

		love.graphics.setFont(font_classicvwf_2x)
		cprint("Game Finished", 0, 200, 800)
		cprint("Final Value: "..TotalValue, 0, 280, 800)
		cprint("High Score: "..HighScore, 0, 250, 800)
		button_highlights(playagain_button, {100, 100, 100, 100}, {255, 255, 255, 100})
		cprint("Play Again", playagain_button.x, playagain_button.y+16, playagain_button.w)
	end

	--system shit

	love.graphics.setCanvas()
	--local ww, wh = love.window.getDimensions()
	setcolor(0, 0, 0)
	setcolorwhite()
	love.graphics.draw(canvas, vidxoffset, vidyoffset, 0, scaleamount)
end

function draw_ingame()
	--Currency and value display
	cprint("Time Left", 0, 4, 550)
	love.graphics.setFont(font_classicvwf_2x)
	cprint(DisplayTime_Big, 0, 16, 550)
	cprint(FramesLeft, 0, 32, 550)
	
	love.graphics.draw(gfx_coin_2x, 8, 8)
	lprint(DisplayNumber(Currency), 48, 16)

	love.graphics.draw(gfx_value_2x, 500, 8)
	rprint(DisplayNumber(TotalValue), 400, 16, 96)




	love.graphics.setFont(font_classicvwf)

	--slime pens
	drawSlimeBox(10, 50, 1)
	drawSlimeBox(280, 50, 4)
	drawSlimeBox(10, 240, 2)
	drawSlimeBox(280, 240, 5)
	drawSlimeBox(10, 430, 3)
	drawSlimeBox(280, 430, 6)

	--highlight active pen
	if sidebar_state ~= sidebar_empty then
		setcolor(255, 255, 255, 50)
		love.graphics.rectangle("fill", slimebox[sidebar_activepen].x, slimebox[sidebar_activepen].y, slimebox[sidebar_activepen].w, slimebox[sidebar_activepen].h)
		love.graphics.rectangle("line", slimebox[sidebar_activepen].x, slimebox[sidebar_activepen].y, slimebox[sidebar_activepen].w, slimebox[sidebar_activepen].h)
		love.graphics.rectangle("line", slimebox[sidebar_activepen].x, slimebox[sidebar_activepen].y, slimebox[sidebar_activepen].w, slimebox[sidebar_activepen].h)
		love.graphics.rectangle("line", slimebox[sidebar_activepen].x, slimebox[sidebar_activepen].y, slimebox[sidebar_activepen].w, slimebox[sidebar_activepen].h)
		love.graphics.rectangle("line", slimebox[sidebar_activepen].x, slimebox[sidebar_activepen].y, slimebox[sidebar_activepen].w, slimebox[sidebar_activepen].h)
		setcolorwhite()
	end

	--side bar
	drawSideBar()
end

function love.quit()
end

function love.mousepressed(mx, my, button)
	mx = mx / scaleamount - xoffset
	my = my / scaleamount - yoffset
	local nocollect = false
	if button == 1 then
		if gamestate == gamestate_ingame then
			--check for clickable areas
			--write actual button shit later
			for i=1,#penbutton1 do
				if button_mouseover(penbutton1[i]) then
					BuySlime(i)
					nocollect = true
				end
			end
			for i=1,#penbutton2 do
				if button_mouseover(penbutton2[i]) then
					sidebar_activepen = i
					sidebar_state = sidebar_upgradepen
					nocollect = true
				end
			end
			if sidebar_state == sidebar_buyslime then
				--swap slime tier/type
				if button_mouseover(slimetype_left) then
					sidebar_slimetype = sidebar_slimetype - 1
					if sidebar_slimetype == 0 then
						sidebar_slimetype = 6
					end
				elseif button_mouseover(slimetype_right) then
					sidebar_slimetype = sidebar_slimetype + 1
					if sidebar_slimetype == 7 then
						sidebar_slimetype = 1
					end
				end


				if button_mouseover(slimetier_left) then
					sidebar_slimetier = sidebar_slimetier - 1
					if sidebar_slimetier == 0 then
						sidebar_slimetier = 5
					end
				elseif button_mouseover(slimetier_right) then
					sidebar_slimetier = sidebar_slimetier + 1
					if sidebar_slimetier == 6 then
						sidebar_slimetier = 1
					end
				end

				if button_mouseover(button_setpenslime) then
					--check to see if you can afford the slime
					if Currency < slime[sidebar_slimetier].cost then
						return
					else
						Currency = Currency - slime[sidebar_slimetier].cost
					end

					--set the pen type to the slime tier/type and add one population
					pen[sidebar_activepen].population = 1
					pen[sidebar_activepen].slimetier = sidebar_slimetier
					pen[sidebar_activepen].slimetype = sidebar_slimetype
					pen[sidebar_activepen].slimecost = math.floor(slime[sidebar_slimetier].cost ^ slimecost_increase)
					pen[sidebar_activepen].name = slimetype[sidebar_slimetype].name.." "..slime[sidebar_slimetier].name.." Pen"

					--add first slime sprite
					--function sprite_init(id, art, spritewidth, spriteheight, bounds)

					local newslime = sprite_init("Slime", slime[pen[sidebar_activepen].slimetier].art, 24, 24, slime[pen[sidebar_activepen].slimetier].bounds, slimetype[pen[sidebar_activepen].slimetype].color)
					newslime.x = slimebox[sidebar_activepen].x + 24 + love.math.random(72)
					newslime.y = slimebox[sidebar_activepen].y + 84 + love.math.random(4)

					table.insert(pen[sidebar_activepen].containedSprites, newslime)

					sidebar_state = sidebar_empty
					sidebar_activepen = 0
				end
			elseif sidebar_state == sidebar_upgradepen then
				if button_mouseover(penupgrade_balance) then
					if Currency >= pen[sidebar_activepen].upgradecost then
						pen[sidebar_activepen].level = pen[sidebar_activepen].level + 1
						pen[sidebar_activepen].balancelevel = pen[sidebar_activepen].balancelevel + 1
						Currency = Currency - pen[sidebar_activepen].upgradecost
						pen[sidebar_activepen].upgradecost = pen[sidebar_activepen].upgradecost ^ upgradecost_multiplier
					end
				elseif button_mouseover(penupgrade_currency) then
					if Currency >= pen[sidebar_activepen].upgradecost then
						pen[sidebar_activepen].level = pen[sidebar_activepen].level + 1
						pen[sidebar_activepen].currencylevel = pen[sidebar_activepen].currencylevel + 1
						Currency = Currency - pen[sidebar_activepen].upgradecost
						pen[sidebar_activepen].upgradecost = pen[sidebar_activepen].upgradecost ^ upgradecost_multiplier
					end
				elseif button_mouseover(penupgrade_value) then
					if Currency >= pen[sidebar_activepen].upgradecost then
						pen[sidebar_activepen].level = pen[sidebar_activepen].level + 1
						pen[sidebar_activepen].valuelevel = pen[sidebar_activepen].valuelevel + 1
						Currency = Currency - pen[sidebar_activepen].upgradecost
						pen[sidebar_activepen].upgradecost = pen[sidebar_activepen].upgradecost ^ upgradecost_multiplier
					end
				end
			end
			--if not clicking in the sidebar or in a slime pen, cancel shop window
			if mx < 550 then
				local cancelview = true
				for i=1,6 do
					if button_mouseover(slimebox[i]) then
						--also collect currency
						if nocollect == false then
							Currency = Currency + math.floor(pen[i].accumulatedCurrency)
							pen[i].accumulatedCurrency = pen[i].accumulatedCurrency - math.floor(pen[i].accumulatedCurrency)
							sidebar_state = sidebar_examinepen
							sidebar_activepen = i
						end
						cancelview = false
					end
				end
				if cancelview == true then
					sidebar_activepen = 0
					sidebar_state = sidebar_empty
				end
			end
		elseif gamestate == gamestate_finished then
			if button_mouseover(playagain_button) then
				newgame()
			end
		end
	end
end

function control_mechanics()
	for i=1,#buttons do
		button_mechanics(buttons[i])
	end
end

function CalculateValue()
	TotalValue = 0
	for i=1,6 do
		TotalValue = TotalValue + getValue(i)
	end
	TotalCPM = 0
end

function BuySlime(activePen)
	if pen[activePen].level == 0 then
		if Currency > pen[activePen].pencost then
			Currency = Currency - pen[activePen].pencost
			pen[activePen].level = 1
		end
		return
	elseif pen[activePen].population == 0 then
		sidebar_state = sidebar_buyslime
		sidebar_activepen = activePen
		sidebar_slimetier = 1
		sidebar_slimtype = 1
	else
		if Currency >= pen[activePen].slimecost then
			Currency = Currency - pen[activePen].slimecost
			pen[activePen].population = pen[activePen].population + 1
			pen[activePen].slimecost = math.floor(pen[activePen].slimecost ^ slimecost_increase)
			local newslime = sprite_init("Slime", slime[pen[activePen].slimetier].art, 24, 24, slime[pen[activePen].slimetier].bounds, slimetype[pen[activePen].slimetype].color)
			newslime.x = slimebox[activePen].x + 24 + love.math.random(72)
			newslime.y = slimebox[activePen].y + 84 + love.math.random(4)
			table.insert(pen[activePen].containedSprites, newslime)
		else
			return
		end
	end
end

function UpgradePen(Tier)
	if Currency >= pen[Tier].upgradecost then
		Currency = Currency - pen[Tier].cost
		pen[Tier].upgradecost = pen[Tier].upgradecost ^ 0.33
		pen[Tier].level = pen[Tier].level + 1
	else
		return
	end
end

function drawSideBar()
	local boxx = 550
	local boxy = 0
	setcolor(30, 55, 80)
	love.graphics.rectangle("fill", boxx, boxy, 250, 600)
	setcolorwhite()

	love.graphics.setFont(font_classicvwf_2x)
	cprint("Gooey Zooey\nPrototype 1", boxx, boxy+20, 250)
	love.graphics.setFont(font_classicvwf)

	boxx = boxx + 20
	boxy = boxy + 50

	boxx = boxx - 10
	boxy = boxy + 100
	if sidebar_state == sidebar_empty then
		drawSideBar_Empty(boxx, boxy)
	elseif sidebar_state == sidebar_examinepen then
		drawSideBar_ExaminePen(boxx, boxy)
	elseif sidebar_state == sidebar_buypen then
		drawSideBar_NewPen(boxx, boxy)
	elseif sidebar_state == sidebar_buyslime then
		drawSideBar_FirstSlime(boxx, boxy)
	elseif sidebar_state == sidebar_upgradepen then
		drawSideBar_UpgradePen(boxx, boxy)
	end
end

function drawSideBar_FirstSlime(boxx, boxy)
	cprint("Create a new slime to put in the pen", boxx, boxy, 230)

	--button highlights
	button_highlights(slimetier_left, {0, 0, 0, 100}, {255, 255, 255, 100})
	button_highlights(slimetier_right, {0, 0, 0, 100}, {255, 255, 255, 100})
	button_highlights(slimetype_left, {0, 0, 0, 100}, {255, 255, 255, 100})
	button_highlights(slimetype_right, {0, 0, 0, 100}, {255, 255, 255, 100})
	button_highlights(button_setpenslime, {0, 0, 0, 100}, {255, 255, 255, 100})

	--tier display
	cprint("Select the tier of slime you want", boxx, boxy+90, 230)
	cprint(slime[sidebar_slimetier].name, boxx, boxy+108, 230)
	lprint(slime[sidebar_slimetier].description, boxx, boxy+130, 230)
	lprint("<", slimetier_left.x+24, slimetier_left.y+8)
	lprint(">", slimetier_right.x+24, slimetier_right.y+8)

	--type display
	cprint("Select the type of slime you want", boxx, boxy+170, 230)
	cprint(slimetype[sidebar_slimetype].name, boxx, boxy+188, 230)
	lprint(slimetype[sidebar_slimetype].description, boxx, boxy+210, 230)
	lprint("<", slimetype_left.x+24, slimetype_left.y+8)
	lprint(">", slimetype_right.x+24, slimetype_right.y+8)

	--stat display
	local thiscpm = slime[sidebar_slimetier].currency * slimetype[sidebar_slimetype].currency * 60
	local thisvalue = slime[sidebar_slimetier].value * slimetype[sidebar_slimetype].value

	lprint("Tier: "..sidebar_slimetier, boxx+10, boxy+20)
	lprint("cpm: "..DisplayNumber(thiscpm), boxx+10, boxy+30)
	lprint("Value: "..DisplayNumber(thisvalue), boxx+10, boxy+40)
	lprint("Cost: "..DisplayNumber(slime[sidebar_slimetier].cost), boxx+10, boxy+50)
	lprint("Penalty: "..slimetype[sidebar_slimetype].penalty, boxx+10, boxy+60)

	--slime type display and options
	cprint("\nPurchase Slime", button_setpenslime.x, button_setpenslime.y, button_setpenslime.w)
	
	

	--slime preview
	setcolor(slimetype[sidebar_slimetype].color[1], slimetype[sidebar_slimetype].color[2], slimetype[sidebar_slimetype].color[3])
	love.graphics.draw(slime[sidebar_slimetier].art, boxx+120, boxy+10, 0, 3)
	setcolorwhite()
end

function getCPM(activePen)
	local penmodifier = 1
	if pen[activePen].balancelevel > 0 then
		penmodifier = penmodifier + pen[activePen].balancelevel * pen_balance_currency
	end
	if pen[activePen].currencylevel > 0 then
		penmodifier = penmodifier + pen[activePen].currencylevel * pen_currency_currency
	end
	if pen[activePen].valuelevel > 0 then
		penmodifier = penmodifier + pen[activePen].valuelevel * pen_value_currency
	end
	return ((slime[pen[activePen].slimetier].currency * slimetype[pen[activePen].slimetype].currency * penmodifier) * (pen[activePen].population ^ slimetype[pen[activePen].slimetype].penalty)) * 60
end

function getNextCPM(activePen)
	local penmodifier = 1
	if pen[activePen].balancelevel > 0 then
		penmodifier = penmodifier + pen[activePen].balancelevel * pen_balance_currency
	end
	if pen[activePen].currencylevel > 0 then
		penmodifier = penmodifier + pen[activePen].currencylevel * pen_currency_currency
	end
	if pen[activePen].valuelevel > 0 then
		penmodifier = penmodifier + pen[activePen].valuelevel * pen_value_currency
	end
	return ((slime[pen[activePen].slimetier].currency * slimetype[pen[activePen].slimetype].currency * penmodifier) * ((pen[activePen].population+1) ^ slimetype[pen[activePen].slimetype].penalty)) * 60
end

function getValue(activePen)
	local penmodifier = 1
	if pen[activePen].balancelevel > 0 then
		penmodifier = penmodifier + pen[activePen].balancelevel * pen_balance_value
	end
	if pen[activePen].currencylevel > 0 then
		penmodifier = penmodifier + pen[activePen].currencylevel * pen_currency_value
	end
	if pen[activePen].valuelevel > 0 then
		penmodifier = penmodifier + pen[activePen].valuelevel * pen_value_value
	end
	return (slime[pen[activePen].slimetier].value * slimetype[pen[activePen].slimetype].value * penmodifier) * pen[activePen].population
end


function drawSideBar_ExaminePen(boxx, boxy)
	if pen[sidebar_activepen].level == 0 then
		cprint("Empty Plot", boxx, boxy, 230)
		lprint("You need to purchase a pen to start a new slim exhibit here.\n\nA new pen here would cost "..DisplayNumber(pen[sidebar_activepen].pencost)..". Click \"Buy Pen\" to purchase a new pen.", boxx, boxy+30, 230)
	else
		if pen[sidebar_activepen].population == 0 then
			cprint("Empty Pen", boxx, boxy, 230)
			lprint("You'll need to create a new slime to place in your pen. click \"Buy Slime\" to get started.", boxx, boxy+30, 230)
		else

			local cpm = DisplayNumber(getCPM(sidebar_activepen))
			local cpm2 = DisplayNumber(getNextCPM(sidebar_activepen) - getCPM(sidebar_activepen))
			local val = DisplayNumber(getValue(sidebar_activepen)/pen[sidebar_activepen].population)

			cprint(slimetype[pen[sidebar_activepen].slimetype].name.." "..slime[pen[sidebar_activepen].slimetier].name, boxx, boxy-20, 230)
			slimebox[button.ID].pen_back = game.add.sprite(slimebox[button.ID].x+6, slimebox[button.ID].y+20, 'pen_back');
                    slimebox[button.ID].slime_container = game.add.group();
                    slimebox[button.ID].pen_front = game.add.sprite(slimebox[button.ID].x+6, slimebox[button.ID].y+20, 'pen_front');
			love.graphics.draw(gfx_pen1_back, boxx+40, boxy-20)
			setcolor(slimetype[pen[sidebar_activepen].slimetype].color[1], slimetype[pen[sidebar_activepen].slimetype].color[2], slimetype[pen[sidebar_activepen].slimetype].color[3])
			love.graphics.draw(slime[pen[sidebar_activepen].slimetier].art, boxx+70, boxy-4, 0, 3)
			setcolorwhite()
			love.graphics.draw(gfx_pen1_front, boxx+40, boxy-20)

			cprint("Slime Info", boxx, boxy+110, 230)
			lprint("Slime Tier: ", boxx, boxy+120, 230)				rprint(slime[pen[sidebar_activepen].slimetier].name, boxx, boxy+120, 230)
			lprint("Slime Type: ", boxx, boxy+130, 230) 				rprint(slimetype[pen[sidebar_activepen].slimetype].name, boxx, boxy+130, 230)
			lprint("Value Per Slime: ", boxx, boxy+140, 230) 		rprint(val, boxx, boxy+140, 230)
			lprint("Currency Per Minute: ", boxx, boxy+150, 230) 	rprint(cpm, boxx, boxy+150, 230)
			lprint("Next Slime Gives: ", boxx, boxy+160, 230) 		rprint("+"..cpm2, boxx, boxy+160, 230)

			cprint("Pen Info", boxx, boxy+200, 230)
			lprint("Population: ", boxx, boxy+210, 230) 			rprint(pen[sidebar_activepen].population, boxx, boxy+210, 230)
			lprint("Pen Balance Level: ", boxx, boxy+220, 230) 		rprint(pen[sidebar_activepen].balancelevel, boxx, boxy+220, 230)
			lprint("Pen Currency Level: ", boxx, boxy+230, 230) 	rprint(pen[sidebar_activepen].currencylevel, boxx, boxy+230, 230)
			lprint("Pen Value Level: ", boxx, boxy+240, 230) 		rprint(pen[sidebar_activepen].valuelevel, boxx, boxy+240, 230)
		end
	end
end

function drawSideBar_UpgradePen(boxx, boxy)
	cprint("Upgrade Pen", boxx, boxy, 230)
	lprint("Upgrading the pen will lower the penalty for the amount of slimes you have inside. It also increases the value and currency generated by each slime.\n\nBalance increases both, Currency or Value increase only one or the other attribute.", boxx, boxy+20, 230)
	cprint("Select Upgrade", boxx, boxy+150, 230)

	button_highlights(penupgrade_balance, {0, 0, 0, 100}, {255, 255, 255, 100})
	lprint("Balance Lv."..(pen[sidebar_activepen].balancelevel), penupgrade_balance.x+4, penupgrade_balance.y+4)
	button_highlights(penupgrade_value, {0, 0, 0, 100}, {255, 255, 255, 100})
	lprint("Value Lv."..(pen[sidebar_activepen].valuelevel), penupgrade_value.x+4, penupgrade_value.y+4)
	button_highlights(penupgrade_currency, {0, 0, 0, 100}, {255, 255, 255, 100})
	lprint("Currency Lv."..(pen[sidebar_activepen].currencylevel), penupgrade_currency.x+4, penupgrade_currency.y+4)
end

function drawSideBar_Empty(boxx, boxy)
	cprint("How to play", boxx, boxy, 230)
	lprint("Buy a pen to place in an empty plot by clicking \"Buy Pen\".\nPens can be upgraded with Currency. Each level of pen has a possible bonus you can select, the bonuses are the same for each level.", boxx, boxy+20, 230)
	lprint("Buy a slime to place in a pen. Slimes don't like other types of slimes, so you can only place one type of slime in a pen.\nYou'll have the option to select the tier (base Currency/Value) and type(modifier) for the slime.", boxx, boxy+110, 230)
	lprint("Slimes have a base value, and generate Currency over time. To collect currency, click within a pen's box.", boxx, boxy+210, 230)
	lprint("You have one month to try to get the most valuable Slime Zoo you can. You won't be able to sell slimes or change upgrades once selected, and only have a maximum of 6 Pens.", boxx, boxy+270, 230)
end

function button_highlights(button, bgcolor, fgcolor)
	if button_mouseover(button) then
		setcolor(fgcolor[1], fgcolor[2], fgcolor[3], fgcolor[4])
	else
		setcolor(bgcolor[1], bgcolor[2], bgcolor[3], bgcolor[4])
	end
	love.graphics.rectangle("fill", button.x, button.y, button.w, button.h)
	love.graphics.rectangle("line", button.x, button.y, button.w, button.h)
	love.graphics.rectangle("line", button.x, button.y, button.w, button.h)
	love.graphics.rectangle("line", button.x, button.y, button.w, button.h)
	love.graphics.rectangle("line", button.x, button.y, button.w, button.h)
	setcolorwhite()
end

function drawSlimeBox(boxx, boxy, drawpen)
	love.graphics.draw(gfx_backdrop, boxx, boxy)

	boxx = boxx+8
	boxy = boxy+8+16
	love.graphics.draw(gfx_nopen, boxx, boxy)

	if pen[drawpen].level == 0 then
		lprint("Empty Plot", boxx-4, boxy-20)
		lprint("Buy Pen", boxx+165, boxy+4)
		button_mouseover(penbutton1[drawpen], true)
		cprint(DisplayNumber(pen[drawpen].pencost).." Gold", boxx+146, boxy+28, 88)
	else
		cpm = DisplayNumber(getCPM(drawpen))
		local thisvalue = DisplayNumber(getValue(drawpen))
		local slimecost = DisplayNumber(pen[drawpen].slimecost)
		local upgradecost = DisplayNumber(pen[drawpen].upgradecost)
		local accumulatedcoins = math.floor(pen[drawpen].accumulatedCurrency)
		accumulatedcoins = DisplayNumber(accumulatedcoins)


		--highlight buttons
		button_mouseover(penbutton1[drawpen], true)
		if pen[drawpen].level > 0 then
			button_mouseover(penbutton2[drawpen], true)
		end

		if pen[drawpen].population > 0 then
			lprint(slimetype[pen[drawpen].slimetype].name.." "..slime[pen[drawpen].slimetier].name, boxx-4, boxy-20)
		else
			lprint("Empty Pen", boxx-4, boxy-20)
		end
		love.graphics.draw(gfx_pen1_back, boxx, boxy)

		--draw slimes inside of the box
		for i=1,#pen[drawpen].containedSprites do
			sprite_draw(pen[drawpen].containedSprites[i], pen[drawpen].containedSprites[i].x, pen[drawpen].containedSprites[i].y)
		end
		--use sprite classes
		--love.graphics.draw(gfx_slime1, boxx+50, boxy+70)

		love.graphics.draw(gfx_pen1_front, boxx, boxy)
		lprint("Lv."..pen[drawpen].level, boxx, boxy)
		--management display
		if slimecost ~= "0" then
			cprint("Buy Slime", boxx+146, boxy, 88)
			cprint(slimecost.." Gold", boxx+146, boxy+8, 88)
		else
			cprint("Buy Slime", boxx+146, boxy+4, 88)
		end
		cprint("Upgrade Pen", boxx+146, boxy+24, 88)
		cprint(upgradecost.." Gold", boxx+146, boxy+32, 88)

		lprint("cpm: "..cpm, boxx+146, boxy+50)
		lprint("Population: "..pen[drawpen].population, boxx+146, boxy+60)

		--coin display
		love.graphics.draw(gfx_coin, boxx+146, boxy+90)
		lprint(accumulatedcoins, boxx+166, boxy+94)

		--value display
		love.graphics.draw(gfx_value, boxx+146, boxy+110)
		lprint(thisvalue, boxx+166, boxy+114)
	end
end

function DisplayNumber(num)
	if num < 1000 then
		return string.format("%0.3g", num)
	elseif num < 1000000 then
		return string.format("%.1fk", num/1000)
	elseif num < 1000000000 then
		return string.format("%.1fm", num/1000000)
	elseif num < 1000000000000 then
		return string.format("%.1fb", num/1000000000)
	elseif num < 1000000000000000 then
		return string.format("%.1ft", num/1000000000000)
	elseif num < 1000000000000000000 then
		return string.format("%.1fq", num/1000000000000000)		
	end
end

function slime_ai(slime)
	if sprite.state == slimeai_state_idle then
		--random chance to hop somewhere
		if math.random(1000) > 5 then
			local newbehavior = math.random(3)
			if newbehavior == 1 then
				slime.state = slimeai_state_hopleft
			elseif newbehavior == 2 then
				slime.state = slimeai_state_hopright
			elseif newbehavior == 3 then
				slime.state = slimeai_state_hopinplace
			elseif newbehavior == 4 then
				slime.state = slimeai_state_blipblop
			end
		end
	end	
	if sprite.state == state_knockback then
		knockback_mechanics(sprite)
	elseif sprite.state == state_stun then
		stun_mechanics(sprite)
	elseif sprite.state == state_ready then
		--not doing anything, do something
		sprite.aitimer = 90
		rval = math.floor(math.random(10))
		if rval > 6 then
			sprite.state = state_idle
			set_idle(sprite)
		else
			randomval = math.floor(math.random(4))
			if randomval == 4 then
				--walk left
				sprite.state = state_moveleft
				sprite_setanimation(sprite, "left")
			elseif randomval == 3 then
				--walk right
				sprite.state = state_moveright
				sprite_setanimation(sprite, "right")
			elseif randomval == 2 then
				--walk up
				sprite.state = state_moveup
				sprite_setanimation(sprite, "up")
			elseif randomval == 1 then
				--walk down
				sprite.state = state_movedown
				sprite_setanimation(sprite, "down")
			end
		end
	else
		ai_walk_core(sprite)
	end
end

function savegame()
	savetable = {}
	savetable[1] = HighScore
	internal_savegame(savetable, "GZDat")
end

function loadgame()
	ltable = internal_loadgame("GZDat")
	HighScore = ltable[1]+0
	if HighScore == nil then
		HighScore = 0
	end
end