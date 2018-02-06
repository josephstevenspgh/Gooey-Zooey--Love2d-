--game framework and utility functions for love2d by setz @splixel on twitter

function setfont(newfont)
	love.graphics.setFont(newfont)
end


function generate_binary_table()
	--half drunk and dont feel like think
	--might be faster anyway
	binlist = {}
	binlist["0000"] = "0"
	binlist["0001"] = "1"
	binlist["0010"] = "2"
	binlist["0011"] = "3"
	binlist["0100"] = "4"
	binlist["0101"] = "5"
	binlist["0110"] = "6"
	binlist["0111"] = "7"
	binlist["1000"] = "8"
	binlist["1001"] = "9"
	binlist["1010"] = "a"
	binlist["1011"] = "b"
	binlist["1100"] = "c"
	binlist["1101"] = "d"
	binlist["1110"] = "e"
	binlist["1111"] = "f"
end

function generate_hexbyte_table()
	hexlist = {}
	hexlist["00"] = 0
	hexlist["01"] = 1
	hexlist["02"] = 2
	hexlist["03"] = 3
	hexlist["04"] = 4
	hexlist["05"] = 5
	hexlist["06"] = 6
	hexlist["07"] = 7
	hexlist["08"] = 8
	hexlist["09"] = 9
	hexlist["0a"] = 10
	hexlist["0b"] = 11
	hexlist["0c"] = 12
	hexlist["0d"] = 13
	hexlist["0e"] = 14
	hexlist["0f"] = 15
	hexlist["10"] = 16
	hexlist["11"] = 17
	hexlist["12"] = 18
	hexlist["13"] = 19
	hexlist["14"] = 20
	hexlist["15"] = 21
	hexlist["16"] = 22
	hexlist["17"] = 23
	hexlist["18"] = 24
	hexlist["19"] = 25
	hexlist["1a"] = 26
	hexlist["1b"] = 27
	hexlist["1c"] = 28
	hexlist["1d"] = 29
	hexlist["1e"] = 30
	hexlist["1f"] = 31
	hexlist["20"] = 32
	hexlist["21"] = 33
	hexlist["22"] = 34
	hexlist["23"] = 35
	hexlist["24"] = 36
	hexlist["25"] = 37
	hexlist["26"] = 38
	hexlist["27"] = 39
	hexlist["28"] = 40
	hexlist["29"] = 41
	hexlist["2a"] = 42
	hexlist["2b"] = 43
	hexlist["2c"] = 44
	hexlist["2d"] = 45
	hexlist["2e"] = 46
	hexlist["2f"] = 47
	hexlist["30"] = 48
	hexlist["31"] = 49
	hexlist["32"] = 50
	hexlist["33"] = 51
	hexlist["34"] = 52
	hexlist["35"] = 53
	hexlist["36"] = 54
	hexlist["37"] = 55
	hexlist["38"] = 56
	hexlist["39"] = 57
	hexlist["3a"] = 58
	hexlist["3b"] = 59
	hexlist["3c"] = 60
	hexlist["3d"] = 61
	hexlist["3e"] = 62
	hexlist["3f"] = 63
	hexlist["40"] = 64
	hexlist["41"] = 65
	hexlist["42"] = 66
	hexlist["43"] = 67
	hexlist["44"] = 68
	hexlist["45"] = 69
	hexlist["46"] = 70
	hexlist["47"] = 71
	hexlist["48"] = 72
	hexlist["49"] = 73
	hexlist["4a"] = 74
	hexlist["4b"] = 75
	hexlist["4c"] = 76
	hexlist["4d"] = 77
	hexlist["4e"] = 78
	hexlist["4f"] = 79
	hexlist["50"] = 80
	hexlist["51"] = 81
	hexlist["52"] = 82
	hexlist["53"] = 83
	hexlist["54"] = 84
	hexlist["55"] = 85
	hexlist["56"] = 86
	hexlist["57"] = 87
	hexlist["58"] = 88
	hexlist["59"] = 89
	hexlist["5a"] = 90
	hexlist["5b"] = 91
	hexlist["5c"] = 92
	hexlist["5d"] = 93
	hexlist["5e"] = 94
	hexlist["5f"] = 95
	hexlist["60"] = 96
	hexlist["61"] = 97
	hexlist["62"] = 98
	hexlist["63"] = 99
	hexlist["64"] = 100
	hexlist["65"] = 101
	hexlist["66"] = 102
	hexlist["67"] = 103
	hexlist["68"] = 104
	hexlist["69"] = 105
	hexlist["6a"] = 106
	hexlist["6b"] = 107
	hexlist["6c"] = 108
	hexlist["6d"] = 109
	hexlist["6e"] = 110
	hexlist["6f"] = 111
	hexlist["70"] = 112
	hexlist["71"] = 113
	hexlist["72"] = 114
	hexlist["73"] = 115
	hexlist["74"] = 116
	hexlist["75"] = 117
	hexlist["76"] = 118
	hexlist["77"] = 119
	hexlist["78"] = 120
	hexlist["79"] = 121
	hexlist["7a"] = 122
	hexlist["7b"] = 123
	hexlist["7c"] = 124
	hexlist["7d"] = 125
	hexlist["7e"] = 126
	hexlist["7f"] = 127
	hexlist["80"] = 128
	hexlist["81"] = 129
	hexlist["82"] = 130
	hexlist["83"] = 131
	hexlist["84"] = 132
	hexlist["85"] = 133
	hexlist["86"] = 134
	hexlist["87"] = 135
	hexlist["88"] = 136
	hexlist["89"] = 137
	hexlist["8a"] = 138
	hexlist["8b"] = 139
	hexlist["8c"] = 140
	hexlist["8d"] = 141
	hexlist["8e"] = 142
	hexlist["8f"] = 143
	hexlist["90"] = 144
	hexlist["91"] = 145
	hexlist["92"] = 146
	hexlist["93"] = 147
	hexlist["94"] = 148
	hexlist["95"] = 149
	hexlist["96"] = 150
	hexlist["97"] = 151
	hexlist["98"] = 152
	hexlist["99"] = 153
	hexlist["9a"] = 154
	hexlist["9b"] = 155
	hexlist["9c"] = 156
	hexlist["9d"] = 157
	hexlist["9e"] = 158
	hexlist["9f"] = 159
	hexlist["a0"] = 160
	hexlist["a1"] = 161
	hexlist["a2"] = 162
	hexlist["a3"] = 163
	hexlist["a4"] = 164
	hexlist["a5"] = 165
	hexlist["a6"] = 166
	hexlist["a7"] = 167
	hexlist["a8"] = 168
	hexlist["a9"] = 169
	hexlist["aa"] = 170
	hexlist["ab"] = 171
	hexlist["ac"] = 172
	hexlist["ad"] = 173
	hexlist["ae"] = 174
	hexlist["af"] = 175
	hexlist["b0"] = 176
	hexlist["b1"] = 177
	hexlist["b2"] = 178
	hexlist["b3"] = 179
	hexlist["b4"] = 180
	hexlist["b5"] = 181
	hexlist["b6"] = 182
	hexlist["b7"] = 183
	hexlist["b8"] = 184
	hexlist["b9"] = 185
	hexlist["ba"] = 186
	hexlist["bb"] = 187
	hexlist["bc"] = 188
	hexlist["bd"] = 189
	hexlist["be"] = 190
	hexlist["bf"] = 191
	hexlist["c0"] = 192
	hexlist["c1"] = 193
	hexlist["c2"] = 194
	hexlist["c3"] = 195
	hexlist["c4"] = 196
	hexlist["c5"] = 197
	hexlist["c6"] = 198
	hexlist["c7"] = 199
	hexlist["c8"] = 200
	hexlist["c9"] = 201
	hexlist["ca"] = 202
	hexlist["cb"] = 203
	hexlist["cc"] = 204
	hexlist["cd"] = 205
	hexlist["ce"] = 206
	hexlist["cf"] = 207
	hexlist["d0"] = 208
	hexlist["d1"] = 209
	hexlist["d2"] = 210
	hexlist["d3"] = 211
	hexlist["d4"] = 212
	hexlist["d5"] = 213
	hexlist["d6"] = 214
	hexlist["d7"] = 215
	hexlist["d8"] = 216
	hexlist["d9"] = 217
	hexlist["da"] = 218
	hexlist["db"] = 219
	hexlist["dc"] = 220
	hexlist["dd"] = 221
	hexlist["de"] = 222
	hexlist["df"] = 223
	hexlist["e0"] = 224
	hexlist["e1"] = 225
	hexlist["e2"] = 226
	hexlist["e3"] = 227
	hexlist["e4"] = 228
	hexlist["e5"] = 229
	hexlist["e6"] = 230
	hexlist["e7"] = 231
	hexlist["e8"] = 232
	hexlist["e9"] = 233
	hexlist["ea"] = 234
	hexlist["eb"] = 235
	hexlist["ec"] = 236
	hexlist["ed"] = 237
	hexlist["ee"] = 238
	hexlist["ef"] = 239
	hexlist["f0"] = 240
	hexlist["f1"] = 241
	hexlist["f2"] = 242
	hexlist["f3"] = 243
	hexlist["f4"] = 244
	hexlist["f5"] = 245
	hexlist["f6"] = 246
	hexlist["f7"] = 247
	hexlist["f8"] = 248
	hexlist["f9"] = 249
	hexlist["fa"] = 250
	hexlist["fb"] = 251
	hexlist["fc"] = 252
	hexlist["fd"] = 253
	hexlist["fe"] = 254
	hexlist["ff"] = 255
end

--utility functions
function rolldie(sides)
	return love.math.random(sides)
end

function isnumber(instring)
	if string.match(instring, "[0-9]") ~= nil then
		return true
	else
		return false
	end
end


--left/right/center print
function lprint(s, x, y, w)
	if w then
		love.graphics.printf(s, x, y, w)
	else
		love.graphics.print(s, x, y)
	end
end
function rprint(s, x, y, w)
	--right align print
	love.graphics.printf(s, x, y, w, "right")
end
function cprint(s, x, y, w)
	--right align print
	love.graphics.printf(s, x, y, w, "center")
end

--color setting
function setcolor(r, g, b, a)
	if not a then
		a = 255
	end
	love.graphics.setColor(r, g, b, a)
end
function setcolorwhite()

	love.graphics.setColor(255, 255, 255, 255)
end

--screen drawing
function drawpixelnocol(x, y)

	love.graphics.rectangle("fill", x, y, 1, 1)
end
function drawpixel(x, y, r, g, b, a)
	local oldr, oldg, oldb, olda = love.graphics.getColor()
	love.graphics.setColor(r, g, b, a)
	love.graphics.rectangle("fill", x, y, 1, 1)
	love.graphics.setColor(oldr, oldg, oldb, olda)
end

--string functions
function explode(instring, delimiter)
	retval = {}
	for word in string.gmatch(instring, '([^'..delimiter..'"]+)') do
    	table.insert(retval, word)
	end
	return retval
	--[[
	--old code
	retval = {}
	lastpos = 1
	for i=1,#instring do
		if string.sub(instring,i,i) == delimiter then
			table.insert(retval, string.sub(instring, lastpos, i-1))
			i = i + 1
			lastpos = i
		end
	end
	return retval]]  
end
function padnum(num, digits)
	local retval = ""
	if string.len(num) < digits then
		local toadd = digits - string.len(num)
		for i=1,toadd do
			retval = "0"..retval
		end
	end
	retval = retval..num
	return retval
end

--hex/dec/bin conversions
function dec2hex(num)
	aval = dec2bin(num)
	rval = bin2hex(aval, 8)
	return rval
end
function dec2bin(num)

	return	getbinary(num)
end
function str2hex(num)

	return hexlist[num]
end
function byte2hex(num)
	aval = getbin(num)
	rval = bin2hex(aval, 2)
	return string.sub(rval, 2, 3)
end
function bin2hex(num, digits)
	rval = b2h(string.sub(num, 0, 4))
	for i=1,digits do
		rval = rval..b2h(string.sub(num, 4*i-3, 4*i))
	end
	return rval
end
function ba(num, num2)
	if (num - num2) >= 0 then
		return "1"
	else
		return "0"
	end
end
function getbinary(num)
	rnum = ""
	for x=1, 8*4 do
		tmp = 2^(8*4-x)
		rnum = rnum..ba(num, tmp)
		if ba(num, tmp) == "1" then
			num = num - tmp
		end
	end
	return rnum
end
function getbin(num)
	rnum = ""
	for x=1, 8 do
		tmp = 2^(8-x)
		rnum = rnum..ba(num, tmp)
		if ba(num, tmp) == "1" then
			num = num - tmp
		end
	end
	return rnum
end
function b2h(num)

	return binlist[num]
end
function stringtobyte(str)

	return string.byte(str)
end


--directional stuff
function find_cardinal(direction)
	if string.find(direction, "left") then
		return "left"
	elseif string.find(direction, "right") then
		return "right"
	elseif string.find(direction, "up") then
		return "up"
	elseif string.find(direction, "down") then
		return "down"
	else
	end
end
function find_cardinal2(direction)
	if string.find(direction, "up") then
		return "up"
	elseif string.find(direction, "down") then
		return "down"
	elseif string.find(direction, "left") then
		return "left"
	elseif string.find(direction, "right") then
		return "right"
	else
	end
end
function opposite_direction(direction)
	if direction == "up" then
		return "down"
	elseif direction == "down" then
		return "up"
	elseif direction == "left" then
		return "right"
	elseif direction == "right" then
		return "left"
	elseif direction == "upleft" then
		return "downright"
	elseif direction == "upright" then
		return "downleft"
	elseif direction == "downleft" then
		return "upright"
	elseif direction == "downright" then
		return "downleft"
	end
	return false
end
function findangle(sprite1, sprite2)
	local s1x = sprite1.x + sprite1.width/2
	local s1y = sprite1.y + sprite1.height/2
	local s2x = sprite2.x + sprite2.width/2
	local s2y = sprite2.y + sprite2.height/2

	local dy = s1y-s2y 
	local dx = s1x-s2x
	return math.atan2(dy,dx)
end
function find_dir_2points(sprite1, sprite2)
	--return an 8-way direction

	--use centered values
	local s1x = sprite1.x + sprite1.width/2
	local s1y = sprite1.y + sprite1.height/2
	local s2x = sprite2.x + sprite2.width/2
	local s2y = sprite2.y + sprite2.height/2

	local dy = s1y-s2y 
	local dx = s1x-s2x
	local angle = math.atan2(dy,dx) * 180 / math.pi
	angle = angle + 180 - 22

	if angle <= 45 then
		return "downright"
	elseif angle <= 90 then
		return "down"
	elseif angle <= 135 then
		return "downleft"
	elseif angle <= 180 then
		return "left"
	elseif angle <= 225 then
		return "upleft"
	elseif angle <= 270 then
		return "up"
	elseif angle <= 315 then
		return "upright"
	else
		return "right"
	end
end
function find_4way_dir(dir)
	if string.find(dir, "left") then
		return "left"
	elseif string.find(dir, "right") then
		return "right"
	elseif string.find(dir, "up") then
		return "up"
	elseif string.find(dir, "down") then
		return "down"
	end
end

--intended for returning to 1 for scaling
function smoothnum(num)
	if num < 1 then
		return num + .01
	elseif num > 1 then
		return num - .01
	end	
	return num
end

--debug functions
function log(s)
	if type(s) == "table" then
		print('table')
		for k,v in pairs(s) do
			print(k.." | "..v)
		end
	else
		print(s)
	end
end	

--audio
function play_sfx(sfx)
	if game_muted == true then
		return
	else
		love.audio.newSource(sfx):play()
	end
end

--controls
function init_button(kc, keyrepeat, repeatframe)
	local retval = {}
	retval.keycode = kc
	retval.ispressed = false
	retval.justpressed = false
	retval.pressedlastframe = false
	retval.keyrepeat = 0
	retval.type = "none"
	retval.curframe = 0
	if keyrepeat then
		retval.keyrepeat = keyrepeat
	else
		retval.keyrepeat = true
	end
	if repeatframe then
		retval.repeatframe = repeatframe
	else
		retval.repeatframe = 10
	end
	return retval
end
function button_add_joypad_button(button, joypad, num)
	button.joypad = joypad
	button.type = "button"
	button.num = num
end
function button_add_joypad_hat(button, joypad, num, dir)
	button.joypad = joypad
	button.type = "hat"
	button.num = num
	button.dir = dir
end
function button_mechanics(button)
	button.pressedlastframe = button.ispressed
	keydown = love.keyboard.isDown(button.keycode)
	if button.type == "button" then
		joydown = button.joypad:isDown(button.num)
	elseif button.type == "hat" then
		if string.find(button.joypad:getHat(button.num), button.dir) then
			joydown = true
		else
			joydown = false
		end
	end
	if keydown or joydown then
		button.ispressed = true
		button.pressed = true


		if button.pressedlastframe then
			button.justpressed = false
			if button.keyrepeat then
				button.curframe = button.curframe + 1
				if button.curframe == button.repeatframe then
					button.justpressed = true
					button.curframe = 0
				end
			end
		else
			button.justpressed = true
		end
	else
		button.ispressed = false
		button.pressed = false
		button.justpressed = false
		button.pressedlastframe = false
		button.curframe = 0
	end
end
function get_joysticks()
	local retval = {}
	for i,joystick in ipairs(love.joystick.getJoysticks()) do
		table.insert(retval, joystick)
	end
	return retval
end

--sprites
function bar_draw(bar, x, y)

	love.graphics.draw(bar.currentart, x, y)
end
function bar_changewidth(thisbar, newwidth)
	thisbar.currentwidth = newwidth

	local barart = thisbar.currentart
	love.graphics.setCanvas(barart)
	love.graphics.clear()
	--get quads
	--quad = love.graphics.newQuad( x, y, width, height, sw, sh )

	thisbar.leftquad = love.graphics.newQuad(0, 0, thisbar.leftwidth, thisbar.height, thisbar.art:getWidth(), thisbar.art:getHeight())
	thisbar.centerquad = love.graphics.newQuad(thisbar.leftwidth, 0, thisbar.centerwidth, thisbar.height, thisbar.art:getWidth(), thisbar.art:getHeight())
	thisbar.rightquad = love.graphics.newQuad(thisbar.leftwidth+thisbar.centerwidth, 0, thisbar.rightwidth, thisbar.height, thisbar.art:getWidth(), thisbar.art:getHeight())

	local drawwidth = thisbar.currentwidth
	if drawwidth >= thisbar.maxwidth-thisbar.rightwidth-thisbar.centerwidth then
		drawwidth = thisbar.maxwidth-thisbar.rightwidth-thisbar.centerwidth
	end

	if drawwidth >= 0 then
		love.graphics.draw(thisbar.art, thisbar.leftquad, 0, 0)
		love.graphics.draw(thisbar.art, thisbar.centerquad, thisbar.leftwidth, 0, 0, drawwidth, 1)
		love.graphics.draw(thisbar.art, thisbar.rightquad, thisbar.leftwidth+drawwidth, 0)
	end

	--	local dsprite = sprite_init("damage number", tempart, 40, 8, {0, 0, 0, 0})
	love.graphics.setCanvas(canvas)
	thisbar.currentart = barart
end
function bar_init(art, mw, iw, lw, cw, rw)
	local thisbar = {}
	thisbar.maxwidth = mw+lw+rw
	thisbar.currentwidth = iw
	thisbar.leftwidth = lw
	thisbar.centerwidth = cw
	thisbar.rightwidth = rw
	thisbar.art = art
	thisbar.height = art:getHeight()
	thisbar.art:setFilter("nearest","nearest")

	local barart = love.graphics.newCanvas(thisbar.maxwidth, thisbar.height)
	love.graphics.setCanvas(barart)
	--get quads
	--quad = love.graphics.newQuad( x, y, width, height, sw, sh )

	thisbar.leftquad = love.graphics.newQuad(0, 0, thisbar.leftwidth, thisbar.height, art:getWidth(), thisbar.height)
	thisbar.centerquad = love.graphics.newQuad(thisbar.leftwidth, 0, thisbar.centerwidth, thisbar.height, art:getWidth(), thisbar.height)
	thisbar.rightquad = love.graphics.newQuad(thisbar.leftwidth+thisbar.centerwidth, 0, thisbar.rightwidth, thisbar.height, art:getWidth(), thisbar.height)

	love.graphics.draw(thisbar.art, thisbar.leftquad, 0, 0)
	love.graphics.draw(thisbar.art, thisbar.centerquad, thisbar.leftwidth, 0, 0, thisbar.currentwidth, 1)
	love.graphics.draw(thisbar.art, thisbar.rightquad, thisbar.leftwidth+thisbar.currentwidth, 0)

	--	local dsprite = sprite_init("damage number", tempart, 40, 8, {0, 0, 0, 0})
	love.graphics.setCanvas(canvas)
	thisbar.currentart = barart
	return thisbar
end

function sprite_getbottom(sprite)
	local bottom = sprite.y + sprite.bounds[2] + sprite.bounds[4]
	return bottom
end

function sprite_init(id, art, spritewidth, spriteheight, bounds, color)
	local sprite = {}
	sprite.emotion = ""
	art:setFilter("nearest","nearest")
	--interactable objects
	sprite.interactable = false
	sprite.canpush = false
	sprite.pushing = false
	sprite.pushdir = ""
	sprite.cuts = false
	sprite.cuttable = false
	sprite.burns = false
	sprite.burnable = false
	--id
	sprite.id = id
	sprite.uid = nextspriteid
	nextspriteid = nextspriteid + 1
	--theres so much stuff
	sprite.currentmovespeed = 1
	sprite.movespeed = 1
	sprite.healthalpha = 0
	sprite.status = "normal"
	sprite.statustimer = 0
	sprite.artsheet = art
	sprite.width = spritewidth
	sprite.height = spriteheight
	sprite.bounds = bounds
	sprite.rotation = 0
	sprite.scalex = 1
	sprite.scaley = 1
	sprite.color = color
	--stats
	sprite.maxhp = 0
	sprite.hp = 0
	sprite.attack = 0
	sprite.defense = 0
	sprite.agility = 0
	sprite.exp = 0
	sprite.gold = 0
	sprite.level = 0
	--init dimensions
	sprite.x = 0
	sprite.y = 0
	sprite.facing = 0
	sprite.lastmovement = "down"
	sprite.abilitydirection = "up"
	sprite.state = 0
	sprite.aitimer = 0
	sprite.movetimer = 0
	sprite.knockbackamount = 0
	sprite.knockbacktimer = 0
	sprite.knockbackdirection = 0
	sprite.boundsx = bounds[1]
	sprite.boundsy = bounds[2]
	sprite.boundswidth = bounds[3]
	sprite.boundsheight = bounds[4]
	--get amount of frames in sheet
	sprite.sheetwidth = art:getWidth()
	sprite.sheetheight = art:getHeight()
	sprite.currentframe = 1
	sprite.animationframe = 1
	sprite.currentanimation = ""
	sprite.animcooldown = 0
	sprite.animationscount = 0
	sprite.timer = 0
	sprite.framecount = sprite.sheetwidth/sprite.width
	if sprite.sheetwidth%sprite.width ~= 0 then
		log("error: spritesheet width isnt multiple of sprite size")
		log(sprite.sheetwidth.." "..sprite.width)
		return
	end
	if sprite.sheetheight%sprite.height ~= 0 then
		log("error: spritesheet height isnt multiple of sprite size")
		return
	end
	--set frames
	sprite.frame = {}
	for i=1, sprite.framecount do
		table.insert(sprite.frame, love.graphics.newQuad((i-1)*sprite.width, 0, sprite.width, sprite.height, sprite.sheetwidth, sprite.sheetheight))
	end
	--init animations
	sprite.animations = {}

	return sprite
end

function sprite_resetai(sprite)
	sprite.aitimer = 0
	sprite.state = 0
	sprite.movetimer = 0
end

function get_movedir_state(movedir)
	if movedir == "up" then
		return state_moveup
	elseif movedir == "down" then
		return state_movedown
	elseif movedir == "left" then
		return state_moveleft
	elseif movedir == "right" then
		return state_moveright
	elseif movedir == "upleft" then
		return state_moveupleft
	elseif movedir == "upright" then
		return state_moveupright
	elseif movedir == "downleft" then
		return state_movedownleft
	elseif movedir == "downright" then
		return state_movedownright
	else
		return state_idle
	end
end

function do_aitimer(sprite)
	sprite.aitimer = sprite.aitimer - 1
	if sprite.aitimer <= 0 then
		sprite_resetai(sprite)
	end
end

function sprite_angled_movement(sprite, direction, amount, walls)
	local oldx, oldy = sprite.x, sprite.y
	local canmove = true
	--direction is an angle
	local dx, dy = math.cos(direction) * sprite.walkspeed, math.sin(direction) * sprite.walkspeed
	local ox, oy = sprite.x, sprite.y
	sprite.x = sprite.x + -dx
	sprite.y = sprite.y + -dy
	if walls then
		if checkmapoverlap(sprite, currentcollision) then
			sprite.x = ox
			sprite.y = oy
		end
	end
end

function sprite_movement(sprite, direction, amount)
	sprite.lastmovement = direction
	local oldx, oldy = sprite.x, sprite.y
	local canmove = true
	if string.find(direction, "up") then
		sprite.y = sprite.y - amount
	elseif string.find(direction, "down") then
		sprite.y = sprite.y + amount
	end
	if checkmapoverlap(sprite, currentcollision) then
		if sprite.pushing then
			sprite.x = oldx
			sprite.y = oldy
			canmove = false
		else
			sprite.x = sprite.x + amount
			if checkmapoverlap(sprite, currentcollision) then
				sprite.x = sprite.x - amount*2
				if checkmapoverlap(sprite, currentcollision) then
					sprite.x = oldx
					sprite.y = oldy
					canmove = false
				end
			end
		end
	end
	oldy = sprite.y
	if string.find(direction, "left") then
		sprite.x = sprite.x - amount
	elseif string.find(direction, "right") then
		sprite.x = sprite.x + amount
	end
	if checkmapoverlap(sprite, currentcollision) then
		if sprite.pushing then
			sprite.x = oldx
			sprite.y = oldy
			canmove = false
		else
			sprite.y = sprite.y + amount
			if checkmapoverlap(sprite, currentcollision) then
				sprite.y = sprite.y - amount*2
				if checkmapoverlap(sprite, currentcollision) then
					sprite.x = oldx
					sprite.y = oldy
					canmove = false
				end
			end
		end
	end
	return canmove
end

--animation
function sprite_hasanimation(sprite, animation)
	for key,value in pairs(sprite.animations) do 
		if animation == sprite.animations[key].name then
			return true
		end
	end
	return false
end
function sprite_setanimation(sprite, animation)
	if sprite.currentanimation ~= animation then
		sprite.currentanimation = animation
		sprite.animationframe = 1
		sprite.timer = 0
	end
end
function sprite_playanimation(sprite)
	if sprite.currentanimation == "" then
		sprite.currentframe = 1
	else
		sprite.timer = sprite.timer + 1
		if sprite.timer >= sprite.animations[sprite.currentanimation].speed[sprite.animationframe] then
			sprite.timer = 0
			sprite.animationframe = sprite.animationframe + 1
			if sprite.animationframe > sprite.animations[sprite.currentanimation].framecount then
				sprite.animationframe = 1
			end
		end
		sprite.currentframe = sprite.animations[sprite.currentanimation].frames[sprite.animationframe]
	end
end
function sprite_addanimation(sprite, animname, frames, speed)
	sprite.animationscount = sprite.animationscount + 1
	sprite.animations[animname] = {}
	sprite.animations[animname].name = animname
	sprite.animations[animname].speed = speed
	sprite.animations[animname].frames = frames
	sprite.animations[animname].framecount = #frames
end

function sprite_draw(sprite, x, y)
	local oldx = sprite.x
	local oldy = sprite.y
	if x then
		sprite.x = x
	end
	if y then
		sprite.y = y
	end
	if sprite.drawmode == "add" then
		love.graphics.setBlendMode("add")
	end
	if sprite.emotion == "!" then
		sp_exclamation.x = sprite.x-2
		sp_exclamation.y = sprite.y-4
		sprite_draw(sp_exclamation)
	end
	if sprite.status == "burn" then
		love.graphics.setColor(255, 50, 50, 255)
	elseif sprite.status == "poison" then
		love.graphics.setColor(100, 255, 100, 255)
	elseif sprite.status == "fade" then
		love.graphics.setColor(255, 255, 255, sprite.statustimer)
	end


	if sprite.color ~= nil then
		love.graphics.setColor(sprite.color[1], sprite.color[2], sprite.color[3], sprite.color[4])
	else
		love.graphics.setColor(255, 255, 255, 255)
	end

	if foglayer then
		local ox, oy, ow, oh = sprite.frame[sprite.currentframe]:getViewport()
		local topquad = love.graphics.newQuad(ox, oy, ow, oh-fogheight, sprite.artsheet:getWidth(), sprite.artsheet:getHeight())
		local botquad = love.graphics.newQuad(ox, oy+sprite.height-fogheight, ow, fogheight, sprite.artsheet:getWidth(), sprite.artsheet:getHeight())
		--local topquad = love.graphics.newQuad(0, 0, sprite.width, sprite.height-fogheight, tmpcanvas:getWidth(), tmpcanvas:getHeight())
		--local botquad = love.graphics.newQuad(0, sprite.height-fogheight, sprite.width, fogheight, tmpcanvas:getWidth(), tmpcanvas:getHeight())
		
		--love.graphics.setCanvas(tmpcanvas)
		--love.graphics.clear()
		--love.graphics.draw(sprite.artsheet, sprite.frame[sprite.currentframe])
		
		--draw above fog
		love.graphics.setCanvas(toplayer)
		love.graphics.draw(sprite.artsheet, topquad, math.floor(sprite.x+sprite.width/2), math.floor(sprite.y+sprite.height/2), sprite.rotation, sprite.scalex, sprite.scaley, sprite.width/2, sprite.height/2)		
		--draw below fog
		love.graphics.setCanvas(bottomlayer)
		love.graphics.draw(sprite.artsheet, botquad, math.floor(sprite.x+sprite.width/2), math.floor(sprite.y+sprite.height/2)+sprite.height-fogheight, sprite.rotation, sprite.scalex, sprite.scaley, sprite.width/2, sprite.height/2)
		--
		love.graphics.setCanvas(canvas)
	else
		love.graphics.draw(sprite.artsheet, sprite.frame[sprite.currentframe], math.floor(sprite.x+sprite.width/2), math.floor(sprite.y+sprite.height/2), sprite.rotation, sprite.scalex, sprite.scaley, sprite.width/2, sprite.height/2)
	end
	love.graphics.setColor(255, 255, 255, 255)
	if sprite.drawmode == "add" then
		love.graphics.setBlendMode("alpha")
	end
	if x then
		sprite.x = oldx
	end
	if y then
		sprite.y = oldy
	end
end

function sprite_drawhitbox(sprite)
	love.graphics.setLineStyle("rough")
	love.graphics.setLineWidth(1)
	love.graphics.rectangle("line", sprite.x + sprite.boundsx, sprite.y+sprite.boundsy, sprite.boundswidth, sprite.boundsheight)
end

--collision
function checkgroupoverlap(sprite, group)
	for i=1,#group do
		if checkoverlap(sprite, group[i]) then
			--dont check for itself
			if sprite.uid ~= group[i].uid then
				return i
			end
		end
	end
	return false
end
function checkoverlap(sprite1, sprite2)
	local s1x = sprite1.x + sprite1.boundsx
	local s1y = sprite1.y + sprite1.boundsy
	local s2x = sprite2.x + sprite2.boundsx
	local s2y = sprite2.y + sprite2.boundsy
	if 	s1x < s2x+sprite2.boundswidth and 
		s1x+sprite1.boundswidth > s2x and 
		s1y < s2y + sprite2.boundsheight and 
		s1y + sprite1.boundsheight > s2y then
		return true
	else
		return false
	end
end
function checkmapoverlap_pure(sprite, map)
	local sx = sprite.x + sprite.boundsx
	local sy = sprite.y + sprite.boundsy 
	if sx <= 0 then
		return true
	elseif sy <= 0 then
		return true
	elseif sx + sprite.boundswidth > #map then
		return true
	elseif sy + sprite.height-24 > #map[1] then
		return true
	end
	for x=0,sprite.boundswidth do
		for y=0,sprite.boundsheight do
			local curval = map[math.floor(sx+x)][math.floor(sy+y)]
			if curval == "solid" then
				return true
			elseif curval == "climb" then
				return true
			elseif curval == "hooks" then
				return true
			end
		end
	end
	--also check for unwalkable sprites in npcgroup
	local grouphit = checkgroupoverlap(sprite, npcgroup)
	if grouphit ~= false then
		--solid object check
		if npcgroup[grouphit].solid then
			return true
		end
	end
	return false	
end
function checkmapoverlap(sprite, map)
	local sx = sprite.x + sprite.boundsx
	local sy = sprite.y + sprite.boundsy 
	if sx <= 0 then
		return true
	elseif sy <= 0 then
		return true
	elseif sx + sprite.boundswidth > #map then
		return true
	elseif sy + sprite.height-24 > #map[1] then
		return true
	end
	for x=0,sprite.boundswidth do
		for y=0,sprite.boundsheight do
			local curval = map[math.floor(sx+x)][math.floor(sy+y)]
			if curval == "solid" then
				return true
			elseif curval == "climb" then
				sprite.currentmovespeed = 1
				sprite.climbing = true
			elseif curval == "hooks" and sprite.hooks == true then
				sprite.climbing = true
			elseif curval == "hooks" and sprite.hooks == false then
				return true
			else
				sprite.climbing = false
			end
		end
	end
	--also check for unwalkable sprites in npcgroup
	local grouphit = checkgroupoverlap(sprite, npcgroup)
	if grouphit ~= false then
		--enemies dont walk into other enemies
		if npcgroup[grouphit].type == "enemy" and sprite.type == "enemy" then
			return true
		end
		if npcgroup[grouphit].solid then
			if npcgroup[grouphit].type == "push1" and sprite.canpush and find_direction() then
				sprite.pushing = true
				sprite.pushdir = find_pushdir(npcgroup[grouphit])
				sprite.currentmovespeed = .25
				sprite_movement(npcgroup[grouphit], find_pushdir(npcgroup[grouphit]), sprite.currentmovespeed)
			end
			return true
		end
	end
	return false
end

--camera
function get_cameracoords(obj)
	local cx = obj.x - screen.width/2
	local cy = obj.y - screen.height/2
	--bounds
	if cx < 0 then cx = 0 end
	if cy < 0 then cy = 0 end
	if cx > currentmap.width - screen.width then cx = currentmap.width - screen.width end
	if cy > currentmap.height - screen.height then cy = currentmap.height - screen.height end
	return cx, cy
end
function camera_center(obj)
	local cx = obj.x - screen.width/2
	local cy = obj.y - screen.height/2
	--bounds
	if cx < 0 then cx = 0 end
	if cy < 0 then cy = 0 end
	if cx > currentmap.width - screen.width then cx = currentmap.width - screen.width end
	if cy > currentmap.height - screen.height then cy = currentmap.height - screen.height end		
	love.graphics.translate(-cx, -cy)
end

--tileset management
function load_tileset(mapfile)
	local retval = {}
	local height = 0
	for line in love.filesystem.lines(mapfile) do
		table.insert(retval, explode(line, ","))
		height = height + 16
	end
	local width = #retval[1]*16
	return retval, width, height
end
function get_tilemapbatch(map, art)
	--spritebatch it all first
	local tsbatch = love.graphics.newSpriteBatch(art, 50000, "static")
	for row=1, #map do
		for col=1, #map[row] do
			local thistile = love.graphics.newQuad(map[row][col]*16, 0, 16, 16, art:getWidth(), art:getHeight())
			local id = tsbatch:add(thistile, col*16-16, row*16-16)
		end
	end
	return tsbatch
end

function generatecollision(infile)
	local cmap = love.image.newImageData(infile)
	local retval = {}
	for x=0,cmap:getWidth()-1 do
		retval[x] = {}
		for y=0,cmap:getHeight()-1 do
			r,g,b,a = cmap:getPixel(x, y)
			if r == 255 and b == 255 and g == 255 then
				--unpassable
				retval[x][y] = "solid"
			elseif r == 255 and b == 0 and g == 0 then
				--climbing, needs hooks
				retval[x][y] = "hooks"
			elseif r == 255 and b == 0 and g == 255 then
				--climbing
				retval[x][y] = "climb"
			else
				retval[x][y] = false
			end
		end
	end
	return retval
end

--file i/o
function internal_savetable(savetable, savefile)
	--save a full table in key=pairs format -- no nested tables
	writestring = ""
	for key,value in pairs(savetable) do
		if value == false then
			value = "false"
		elseif value == true then
			value = "true"
		end
		writestring = writestring..key.."="..value.."\n"
	end
	if love.filesystem.write(savefile, writestring) then
		return true
	else
		return false
	end	
end
function internal_loadtable(loadtable, loadfile)
	--save a full table in key=pairs format -- no nested tables
	if love.filesystem.exists(loadfile) then
		for line in love.filesystem.lines(loadfile) do
			local tmptable = explode(line, "=")
			if isnumber(tmptable[2]) then
				tmptable[2] = tmptable[2] + 0
			end
			loadtable[tmptable[1]] = tmptable[2]
		end
		return true
	else
		log("Save doesn't exist")
		return nil
	end
end

function internal_savegame(savetable, savefile)
	file = savefile
	writestring = ""
	for i=1,#savetable do
		writestring = writestring..savetable[i].."\n"
	end
	
	if love.filesystem.write(file, writestring) then
		return true
	else
		return false
	end
end

function internal_loadgame(loadfile)
	if love.filesystem.exists(loadfile) then
		local retval = {}
		for line in love.filesystem.lines(loadfile) do
			table.insert(retval, line)
		end
		return retval
	else
		return nil
	end
end

function stringtobool(arg)
	if arg == "true" then
		return true
	else
		return false
	end
end

--popup libs
--note that you will have to provide your own method for calling popup_advance
function init_popup_setup(textspeed, bgcolor, bgopacity)
	popup = {}
	popup.active = false
	popup.messages = {}
	popup.text = ""
	popup.displayedtext = ""
	popup.printingmessage = false
	--speed is how many delay frames between characters. -1 is instant full print, 
	if textspeed == nil then
		popup.textspeed = 1
	else
		popup.textspeed = textspeed
	end
	popup.x = 0
	popup.y = 0
	popup.texttimer = 0
	popup.centeredx = false
	popup.centeredy = false
	popup.padding = 4
	if bgcolor == nil then
		popup.backgroundcolor = {0, 0, 0}
	else
		popup.backgroundcolor = bgcolor
	end
	if bgopacity == nil then
		popup.backgroundopacity = 175
	else
		popup.backgroundopacity = bgopacity
	end
	popup.textcolor = {255, 255, 255}
	popup.textopacity = 255
	return popup
end

function init_popup_message(messagetext, messagetype, actiontext, x, y, width, height)
	--initialize a message to be displayed by the popup system
	message = {}
	if messagetext == nil then
		log("Messages must have text.")
		return
	end
	message.text = messagetext
	message.displayedtext = ""
	if messagetype == nil then
		message.type = messagetype
	else
		message.type = "noaction"
	end
	if actiontext == nil then
		actiontext = "OK"
	else
		--eventually add yes/no prompts
		actiontext = actiontext
	end

	--positioning for message
	message.x = x
	message.y = y
	message.width = width
	message.height = height

	if message.x < 0 then
		message.xcentered = true
	else
		message.xcentered = false
	end
	
	if message.y < 0 then
		message.ycentered = true
	else
		message.ycentered = false
	end

	return message
end

function popup_queue_message(popupsystem, messagetext, messagex, messagey, messagewidth, messageheight, messagetype, actiontext)
	--insert a message into the popup system
	message = init_popup_message(messagetext, messagetype, actiontext, messagex, messagey, messagewidth, messageheight)
	table.insert(popupsystem.messages, message)
	if #popupsystem.messages == 1 then
		popup_setup_message(popupsystem)
	end
end

function popup_setup_message(popupsystem)
	--initialize the current message in the popup system
	local thismessage = popupsystem.messages[1]
	popupsystem.text = thismessage.text
	popupsystem.displayedtext = thismessage.displayedtext
	popupsystem.x = thismessage.x
	popupsystem.y = thismessage.y
	popupsystem.width = thismessage.width
	popupsystem.height = thismessage.height
	popupsystem.xcentered = thismessage.xcentered
	popupsystem.ycentered = thismessage.ycentered
	popupsystem.texttimer = 0

	--check for instant display
	if popupsystem.textspeed < 0 then
		popupsystem.displayedtext = popupsystem.text
		popupsystem.printingmessage = false
		popupsystem.active = true
	else
		popupsystem.printingmessage = true
		popupsystem.active = true		
	end
end

function popup_advance(popupsystem)
	--wait for message to finish printing before avancing
	if popupsystem.printingmessage == false then
		--remove the top message
		table.remove(popupsystem.messages, 1)
		--take next action
		if popupsystem.actiontype == nil then
			if #popupsystem.messages == 0 then
				popupsystem.active = false
			else
				popup_setup_message(popupsystem)
			end
		else
			--other types of action systems taken by popup menus go here
		end
	end
end

function popup_system_update(popupsystem)
	--advance the text
	if #popupsystem.displayedtext < #popupsystem.text then
		popupsystem.texttimer = popupsystem.texttimer + 1
		if popupsystem.texttimer >= popupsystem.textspeed then
			popupsystem.displayedtext = popupsystem.displayedtext..string.sub(popupsystem.text, #popupsystem.displayedtext+1, #popupsystem.displayedtext+1)
			popupsystem.texttimer = 0
			play_sfx(sfx_noiseblip)
		end
		--check for completion
		if #popupsystem.displayedtext == #popupsystem.text then
			popupsystem.printingmessage = false
		end
	end
end

function popup_system_draw(popupsystem)
	local oldcolor = love.graphics.getColor()
	
	local thisx = popupsystem.x
	local thisy = popupsystem.y

	if popupsystem.xcentered then
		thisx = screen.width/2 - popupsystem.width/2
	end

	if popupsystem.ycentered then
		thisy = screen.height/2 - popupsystem.height/2
	end

	--draw background
	setcolor(popupsystem.backgroundcolor[1], popupsystem.backgroundcolor[2], popupsystem.backgroundcolor[3], popupsystem.backgroundopacity)
	love.graphics.rectangle("fill", thisx, thisy, popupsystem.width+popupsystem.padding*2, popupsystem.height+popupsystem.padding*2)
	
	--print text
	setcolor(popupsystem.textcolor[1], popupsystem.textcolor[2], popupsystem.textcolor[3], popupsystem.textopacity)
	lprint(popupsystem.displayedtext, thisx+popupsystem.padding, thisy+popupsystem.padding, popupsystem.width)

	--reset color
	setcolorwhite()
end

--mousey things
function button_mouseover(button, highlight)
	local mousex = love.mouse.getX()/scaleamount - xoffset
	local mousey = love.mouse.getY()/scaleamount - yoffset
	if mousex > button.x and mousex < button.x+button.w and mousey > button.y and mousey < button.y+button.h then
		if highlight == true then
			setcolor(50, 255, 55, 100)
			love.graphics.rectangle("fill", button.x, button.y, button.w, button.h)
			love.graphics.rectangle("line", button.x, button.y, button.w, button.h)
			love.graphics.rectangle("line", button.x, button.y, button.w, button.h)
			love.graphics.rectangle("line", button.x, button.y, button.w, button.h)
			love.graphics.rectangle("line", button.x, button.y, button.w, button.h)
			setcolorwhite()
		end
		return true
	end
	return false
end