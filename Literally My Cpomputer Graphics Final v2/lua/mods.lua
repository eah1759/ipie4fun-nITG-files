if not P1 or not P2 then
	backToSongWheel('Two Player Mode Required')
	return
end

-- judgment / combo proxies
for pn = 1, 2 do
	setupJudgeProxy(PJ[pn], P[pn]:GetChild('Judgment'), pn)
	setupJudgeProxy(PC[pn], P[pn]:GetChild('Combo'), pn)
end
-- player proxies
for pn = 1, #PP do
	AP[pn]:SetTarget(P[pn]) --For the record, AP stands for anti-proxy
	P[pn]:hidden(1)
	PP[pn]:SetTarget(AP[pn])
	AP[pn]:hidden(1)
	PPP[pn]:SetTarget(PP[pn])
	PP[pn]:hidden(1)
end
PostPolishProxy[1]:SetTarget(PostPolish)
PostPolishProxy[2]:SetTarget(PostPolish)
PostPolishProxy[3]:SetTarget(PostPolish)
PostPolishProxy[4]:SetTarget(PostPolish)


-- Spellcards?
card {0,12*4-0.1,'A Whole Lot of Nothing', 0, {0,0,0,1}}
card {12*4,20*4-0.1,'That\'s Kinda Rude but Okay', 4, {1,0,1,1}}
card {20*4,23*4-0.1,'SPIIIIIIIIIIIIIIIIIN', 4, {0,0,1,1}}
card {24*4,24*4+1-0.1,'Gottem', 666, {1,0,0,1}}
card {24*4+1,31*4+1-0.1,'Maybe Not So Loud', 3, {0,1,0,1}}
card {31*4+2,40*4-0.1,'Uhhhhhhhhhhhhhhh', 6, {0,1,1,1}}
card {41*4+1,42*4-1,'Jimmy', -3, {1,1,1,1}}


-- background bullshit
Load:xywh(scx, scy, sw, sh)

Batman:xywh(scx, scy, sw, sh)
Batman:diffuse(0,0,0,1)

BGQuad:xywh(scx, scy, sw, sh)
BGQuad:diffuse(0,0,0,0)
TempQuad:xywh(scx-2, scy-2, sw+4, sh+4)
TempQuad:diffuse(0,0,0,1)

shader(PPPAFTS, PPPAFT)
shader(TAFTS[1], TAFT[1])
shader(TAFTS[2], TAFT[2])
shader(TAFTS[3], TAFT[3])
shader(TAFTS[4], TAFT[4])
PostPolishProxyParent:hidden(1)
TAFTS[1]:hidden(1)
TAFTS[2]:hidden(1)
TAFTS[3]:hidden(1)
TAFTS[4]:hidden(1)
welp:SetFarDist(3500)


Background:xywh(0, 0, sw, sh)
BG:xy(scx, scy)
BG:SetFarDist(2000)
BGitsallabout:y(-sh)
BGhumanity:y(-sh)

-- warning init
WS[1]:SetTarget(Warning)
WS[2]:SetTarget(Warning)
Warning:hidden(1)
Strip1:xywh(sh/10.0, scy, sh/5.0, sh)
Strip2:xywh(sw-sh/10.0, scy, -sh/5.0, sh)
Caution:xywh(scx, scy, sh/1.5, sh/1.5)

-- defaults and other inits
setdefault {2, 'xmod', 100, 'dizzyholds', 100, 'holdcull'}--arrow cull because of funni dance-mode exclusive bug on gottem :)))

shader(AFTSprite, AFT)
PI = 3.14159265

--AFTSprite:SetShader(glitch)
--PP:x() IS OVERWRITTEN IN rotatePPy definemod
	--PP[1]:x((SCREEN_CENTER_X)+SCREEN_CENTER_X*(p/100)/2)
P[1]:x(SCREEN_CENTER_X)
P[2]:x(SCREEN_CENTER_X)
AP[1]:x(-SCREEN_CENTER_X)
AP[2]:x(-SCREEN_CENTER_X)
AP[1]:y(-SCREEN_CENTER_Y)
AP[2]:y(-SCREEN_CENTER_Y)
PP[1]:y(SCREEN_CENTER_Y)
PP[2]:y(SCREEN_CENTER_Y)


-- my code but function definitons
function swingle (startbeat, shortcut)
	for pn = 1, 2 do
	--	add {startbeat-0.25, 0.25, linear,  110, 'tipsy',  25, 'drunk',  25, 'pulse'}
	--	add {startbeat-0.00, 0.25, linear, -110, 'tipsy', -25, 'drunk', -25, 'pulse'}
	--	add {startbeat+0.25, 0.25, linear,  110, 'tipsy',  25, 'drunk',  25, 'pulse'}
	--	add {startbeat+0.50, 0.25, linear, -110, 'tipsy', -25, 'drunk', -25, 'pulse'}
		add {startbeat+0.75, 0.25, linear,  025, 'tipsy',  75, 'drunk',  00, 'pulse', plr = pn}
		add {startbeat+1.00, 0.25, linear, -025, 'tipsy', -75, 'drunk',  00, 'pulse', plr = pn}
		add {startbeat+1.25, 0.25, linear,  025, 'tipsy',  75, 'drunk',  00, 'pulse', plr = pn}
		add {startbeat+1.50, 0.25, linear, -025, 'tipsy', -75, 'drunk',  00, 'pulse', plr = pn}
		add {startbeat+1.75, 0.25, linear,  110, 'tipsy',  25, 'drunk',  25, 'pulse', plr = pn}
		add {startbeat+2.00, 0.25, linear, -110, 'tipsy', -25, 'drunk', -25, 'pulse', plr = pn}
		add {startbeat+2.25, 0.25, linear,  110, 'tipsy',  25, 'drunk',  25, 'pulse', plr = pn}
		add {startbeat+2.50, 0.25, linear, -110, 'tipsy', -25, 'drunk', -25, 'pulse', plr = pn}
		add {startbeat+2.75, 0.25, linear,  110, 'tipsy',  75, 'drunk',  00, 'pulse', plr = pn}
		add {startbeat+3.00, 0.25, linear, -110, 'tipsy', -75, 'drunk',  00, 'pulse', plr = pn}
		add {startbeat+3.25, 0.25, linear,  110, 'tipsy',  75, 'drunk',  00, 'pulse', plr = pn}
		add {startbeat+3.50, 0.25, linear, -110, 'tipsy', -75, 'drunk',  00, 'pulse', plr = pn}
		if(shortcut == 0)
		then
			add {startbeat+4.75, 0.25, linear,  110, 'tipsy',  75*((pn-1)*2-1), 'drunk',  00, 'pulse', plr = pn}
			add {startbeat+5.00, 0.25, linear, -110, 'tipsy', -75*((pn-1)*2-1), 'drunk',  00, 'pulse', plr = pn}
			add {startbeat+5.25, 0.25, linear,  110, 'tipsy',  75*((pn-1)*2-1), 'drunk',  00, 'pulse', plr = pn}
			add {startbeat+5.50, 0.25, linear, -110, 'tipsy', -75*((pn-1)*2-1), 'drunk',  00, 'pulse', plr = pn}
		end
	end
end

function gridScroll(xScroll, yScroll)
	tilesplz:uniform1f('xScroll', xScroll)
	tilesplz:uniform1f('yScroll', yScroll)
	tilesplz1:uniform1f('xScroll', xScroll)
	tilesplz1:uniform1f('yScroll', yScroll)
	tilesplz2:uniform1f('xScroll', xScroll)
	tilesplz2:uniform1f('yScroll', yScroll)
	tilesplz3:uniform1f('xScroll', xScroll)
	tilesplz3:uniform1f('yScroll', yScroll)
	tilesplz4:uniform1f('xScroll', xScroll)
	tilesplz4:uniform1f('yScroll', yScroll)
end

function gridScrollx(xScroll)
	tilesplz:uniform1f('xScroll', xScroll)
	tilesplz1:uniform1f('xScroll', xScroll)
	tilesplz2:uniform1f('xScroll', xScroll)
	tilesplz3:uniform1f('xScroll', xScroll)
	tilesplz4:uniform1f('xScroll', xScroll)
end

function gridScrolly(yScroll)
	tilesplz:uniform1f('yScroll', yScroll)
	tilesplz1:uniform1f('yScroll', yScroll)
	tilesplz2:uniform1f('yScroll', yScroll)
	tilesplz3:uniform1f('yScroll', yScroll)
	tilesplz4:uniform1f('yScroll', yScroll)
end

function glitchShader(p)
	glitch:uniform1f('per', p)
end

function clamp(n, min, max)
	if n>max then return max end
	if n<min then return min end
	return n
end

-- and now the definemod section
definemod {'rotatebg', function(p)
	BG:rotationy(p)
	--BG:z(-3*p)
end}

definemod {'smoovebg', function(p)
	BG:x((SCREEN_CENTER_X)+SCREEN_CENTER_X*(p/100)/2)
end}

definemod {'moovebgy', function(p)
	BG:y((SCREEN_CENTER_Y)+SCREEN_CENTER_Y*(p/100)/2)
end}

definemod {'movebgz', function(p)
	BG:z(p)
end}

definemod {'gridScrollx', function(p)
	gridScrollx(p/100)
	for pppn = 1, 4 do
		PostPolishProxy[pppn]:x(((((-sw)*(p/100))+(sw))%sw)-(((2*(pppn%2)))*(sw/2)))
	end
end}

definemod {'gridScrolly', function(p)
	gridScrolly(p/100)
	for pppn = 1, 4 do
		PostPolishProxy[pppn]:y(((((sh)*(p/100)))%sh)-(math.floor((pppn-1)/2)*sh))
	end
end}

definemod {'rotatePPy', function(p)
	PP[1]:rotationy(p)
	PP[2]:rotationy(p)
end}

definemod {'rotatePPy2', function(p)
	PP[1]:rotationy(p)
	PP[2]:rotationy(180+p)
end}

definemod {'smoovePPx', function(p)
	PP[1]:x((SCREEN_CENTER_X)+SCREEN_CENTER_X*(p/100)/2)
	PP[2]:x((SCREEN_CENTER_X)+SCREEN_CENTER_X*(p/100)/2)
end}

definemod {'rotatePx', function(p)
	P[1]:rotationx(p)
	P[2]:rotationx(p)
end}

definemod {'glitchShader', function(p)
	glitchShader(p/100)
end}

definemod {'warningmove', function(p)
	if(p>0)
	then
		WS[1]:y(SCREEN_HEIGHT*((p/100)%1))
		WS[2]:y((-SCREEN_HEIGHT)+SCREEN_HEIGHT*((p/100)%1))
	else
		WS[1]:y(SCREEN_HEIGHT*((p/100)%1))
		WS[2]:y((SCREEN_HEIGHT)+SCREEN_HEIGHT*((p/100)%1))
	end
end}

definemod {'warningalpha', function(p)
	Warning:diffuse(1,0,0,0+(p/100))
end}

definemod {'gridzMove', function(p)
	--be a shame if I ham-fisted some post polish into this def mod.
	PostPolishProxyParent:z(800-(p%800)) --IT JUST WORKS LMAO
	--AAAAAAAAAAAA
	TAFTS[1]:hidden(math.floor(clamp((800-p),0,1)))
	TAFTS[2]:hidden(math.floor(clamp((1600-p),0,1)))
	TAFTS[3]:hidden(math.floor(clamp((2400-p),0,1)))
	TAFTS[4]:hidden(math.floor(clamp((3200-p),0,1)))
	--okay, now for the non-post polish
	PPPAFTS:z(-(p))
	TAFTS[1]:z(800-(p))
	TAFTS[2]:z(1600-(p))
	TAFTS[3]:z(2400-(p))
	TAFTS[4]:z(3200-(p))
end}

definemod {'bgiaa-Move', function(y)
	BGitsallabout:y(y)
end}

definemod {'bgh-Move', function(y)
	BGhumanity:y(y)
end}

definemod {'bgit-Move', function(y)
	BGinthe:y(y)
end}

definemod {'bgg-Move', function(y)
	BGgroove:y(y)
end}

definemod {'bgitgHidden', function(p)
	BGinthe:hidden(p)
	BGgroove:hidden(p)
end}

definemod {'bgbHidden', function(p)
	BGTextBits:hidden(p)
	BGitsallabout:hidden(1-p)
	BGhumanity:hidden(1-p)
end}

definemod {'hideload', function(p)
	Load:hidden(p)
end}

definemod {'bgiaa-Rotate', function(p)
	BGitsallabout:rotationz(p)
end}

definemod {'bgh-Rotate', function(p)
	BGhumanity:rotationz(p)
end}

definemod {'bgit-Rotate', function(p)
	BGinthe:rotationz(p)
end}

definemod {'bgg-Rotate', function(p)
	BGgroove:rotationz(p)
end}


--back ground bits
definemod {'bgb-its-Move', function(p)
	BGBits:z(p)
end}

definemod {'bgb-all-Move', function(p)
	BGBall:z(p)
end}

definemod {'bgb-a-Move', function(p)
	BGBa:z(p)
end}

definemod {'bgb-bout-Move', function(p)
	BGBbout:z(p)
end}


definemod {'bgb-hu-Move', function(p)
	BGBhu:z(p)
end}

definemod {'bgb-man-Move', function(p)
	BGBman:z(p)
end}

definemod {'bgb-i-Move', function(p)
	BGBi:z(p)
end}

definemod {'bgb-ty-Move', function(p)
	BGBty:z(p)
end}

-- actual start of mods
set {0, 75, 'drunkperiod', 123, 'drunkspeed', 775, 'drunkspacing', 357, 'drunksize', 456, 'tipsyspeed', 169, 'tipsyspacing'}--, 150, 'tipsysize'}

--FIXING BACKGROUND DUE TO OVERWRITTEN DEFMODS
set {0, -sh*2, 'bgiaa-Move', -sh*2, 'bgh-Move', 1, 'bgbHidden', 1, 'hideload'}

--warning test
ease {16*4+0-.25, 1, tri, 6.25, 'warningalpha'}
ease {16*4+1-.25, 1, tri, 12.5, 'warningalpha'}
ease {16*4+2-.25, 1, tri, 18.75, 'warningalpha'}
ease {16*4+3-.25, 1, tri, 25, 'warningalpha'}
ease {16*4+4-.25, 1, tri, 31.25, 'warningalpha'}
ease {16*4+5-.25, 1, tri, 37.5, 'warningalpha'}
ease {16*4+6-.25, 1, tri, 43.75, 'warningalpha'}
ease {16*4+7-.25, 1, tri, 50, 'warningalpha'}
ease {16*4+8-.25, 1, tri, 56.25, 'warningalpha'}
ease {16*4+9-.25, 1, tri, 62.5, 'warningalpha'}
ease {16*4+10-.25, 1, tri, 68.75, 'warningalpha'}
ease {16*4+11-.25, 1, tri, 75, 'warningalpha'}
ease {16*4+12-.25, 1, tri, 81.25, 'warningalpha'}
ease {16*4+13-.25, 1, tri, 87.5, 'warningalpha'}
ease {16*4+14-.25, 1, tri, 93.75, 'warningalpha'}
ease {16*4+15-.25, 1, tri, 100, 'warningalpha'}

ease {16*4+16-.25, 1, tri, 100, 'warningalpha'}
ease {16*4+17-.25, 1, tri, 100, 'warningalpha'}
ease {16*4+18-.25, 1, tri, 100, 'warningalpha'}
ease {16*4+19-.25, 1, tri, 100, 'warningalpha'}
ease {16*4+20-.25, 1, tri, 100, 'warningalpha'}
ease {16*4+21-.25, 1, tri, 100, 'warningalpha'}
ease {16*4+22-.25, 1, tri, 100, 'warningalpha'}
ease {16*4+23-.25, 1, tri, 100, 'warningalpha'}
ease {16*4+24-.25, 1, tri, 100, 'warningalpha'}
ease {16*4+25-.25, 1, tri, 100, 'warningalpha'}
ease {16*4+26-.25, 1, tri, 100, 'warningalpha'}
ease {16*4+27-.25, 1, tri, 100, 'warningalpha'}

ease {16*4+0-.25, 27, linear, 200, 'beat'}
set {23*4, 0, 'beat'}

ease {0, 8, linear, -100, 'warningmove'}
--back to back spin and column swaps
set {0, PI*100, 'confusionzoffset0', PI*100, 'confusionzoffset3', 100, 'flip', plr = 2}
plr = 1
--<^v> ^<>v ^><v
ease {13*4+2.25, 0.5, inOutExpo, 25, 'flip', -75, 'invert'}
ease {13*4+2.75, 0.5, inOutExpo, 75, 'flip', -125, 'invert'}
ease {13*4+3.25, 0.5, inOutExpo, 100, 'flip', -100, 'invert'}
-->^v< >v^< v><^
ease {15*4+2.25, 0.5, inOutExpo, 100, 'flip', 0, 'invert'}
ease {15*4+2.75, 0.5, inOutExpo, 75, 'flip', 75, 'invert'}
ease {15*4+3.25, 0.5, inOutExpo, 25, 'flip', 125, 'invert'}
--v<>^ <v^> <^v>
ease {17*4+2.25, 0.5, inOutExpo, 0, 'flip', 100, 'invert'}
ease {17*4+2.75, 0.5, inOutExpo, 0, 'flip', 0, 'invert'}
ease {17*4+3.25, 0.5, inOutExpo, 25, 'flip', -75, 'invert'}
--^<>v ^><v >^v<
ease {19*4+2.25, 0.5, inOutExpo, 75, 'flip', -125, 'invert'}
ease {19*4+2.75, 0.5, inOutExpo, 100, 'flip', -100, 'invert'}
ease {19*4+3.25, 0.5, inOutExpo, 100, 'flip', 0, 'invert'}
plr = 2
--<^v> ^<>v ^><v
ease {13*4+2.25, 0.5, inOutExpo, 75, 'flip', 75, 'invert'}
ease {13*4+2.75, 0.5, inOutExpo, 25, 'flip', 125, 'invert'}
ease {13*4+3.25, 0.5, inOutExpo, 0, 'flip', 100, 'invert'}
-->^v< >v^< v><^
ease {15*4+2.25, 0.5, inOutExpo, 0, 'flip', 0, 'invert'}
ease {15*4+2.75, 0.5, inOutExpo, 25, 'flip', -75, 'invert'}
ease {15*4+3.25, 0.5, inOutExpo, 75, 'flip', -125, 'invert'}
--v<>^ <v^> <^v>
ease {17*4+2.25, 0.5, inOutExpo, 100, 'flip', -100, 'invert'}
ease {17*4+2.75, 0.5, inOutExpo, 100, 'flip', 0, 'invert'}
ease {17*4+3.25, 0.5, inOutExpo, 75, 'flip', 75, 'invert'}
--^<>v ^><v >^v<
ease {19*4+2.25, 0.5, inOutExpo, 25, 'flip', 125, 'invert'}
ease {19*4+2.75, 0.5, inOutExpo, 0, 'flip', 100, 'invert'}
ease {19*4+3.25, 0.5, inOutExpo, 0, 'flip', 0, 'invert'}
plr = {1,2}
func {4, function()
	PP[2]:rotationy(180)
end}
ease {20*4, 3*4, inQuart, 360*15, 'rotatePPy2'}
set {23*4, 0, 'rotatePPy', 0, 'flip', 0, 'invert', 0, 'confusionzoffset0', 0 ,'confusionzoffset3'}

--actual actual start of mods

-- receptor stuff (intro)
dfi = 0.1 --darkfadein
set {0, 100, 'dark'}
ease {8-(dfi/2), dfi, linear, 90, 'dark'}
ease {8+(dfi/2), 4-dfi, linear, 100, 'dark'}
ease {16-(dfi/2), dfi, linear, 80, 'dark'}
ease {16+(dfi/2), 4-dfi, linear, 100, 'dark'}
ease {24-(dfi/2), dfi, linear, 70, 'dark'}
ease {24+(dfi/2), 4-dfi, linear, 100, 'dark'}
ease {32-(dfi/2), dfi, linear, 60, 'dark'}
ease {32+(dfi/2), 4-dfi, linear, 100, 'dark'}
ease {40-(dfi/2), dfi, linear, 50, 'dark'}
ease {40+(dfi/2), 4-dfi, linear, 100, 'dark'}
ease {48-(dfi/2), dfi, linear, 40, 'dark'}
ease {48+(dfi/2), 4-dfi, linear, 100, 'dark'}
ease {56-(dfi/2), dfi, linear, 30, 'dark'}
ease {56+(dfi/2), 4-dfi, linear, 100, 'dark'}
ease {64-(dfi/2), dfi, linear, 20, 'dark'}
ease {64+(dfi/2), 4-dfi, linear, 100, 'dark'}
ease {72-(dfi/2), dfi, linear, 10, 'dark'}
ease {72+(dfi/2), 4-dfi, linear, 100, 'dark'}
ease {80-(dfi/2), dfi, linear, 0, 'dark'}
ease {80+(dfi/2), 4-dfi, linear, 100, 'dark'}
set  {92-(dfi/2), 0, 'dark'}

func {15*4+0.5, function(b)
	PPPAFTS:SetShader(glitch)
end}
func {15*4+1.5, function(b)
	PPPAFTS:ClearShader()
end}
ease {15*4+0.5, 1, bounce, 100, 'glitchShader'}

--funny bg text!!! (This could still look smoother but whatever)
set {23*4-1, -90, 'bgiaa-Rotate', -90, 'bgh-Rotate'}
ease {23*4-0.5, 3, outBack, 0, 'bgiaa-Move', 0, 'bgiaa-Rotate'}
ease {23*4-0.25, 3, outExpo, 2*sh, 'bgit-Move', 90, 'bgit-Rotate'}
ease {23*4+1.5, 2.33, outBack, 0, 'bgh-Move', 0, 'bgh-Rotate'}
ease {23*4+1.75, 3, outExpo, 2*sh, 'bgg-Move', 90, 'bgg-Rotate'}
set {24*4, 1, 'bgitgHidden'}

--more funny bg text (fills)
set {25*4, 0, 'bgbHidden'}

ease {25*4+2.75, 0.25, outExpo, 200, 'bgb-bout-Move'}
ease {25*4+3.25, 0.25, inExpo,  0,   'bgb-bout-Move'}
ease {25*4+3.25, 0.25, outExpo, 200, 'bgb-hu-Move'}
ease {25*4+3.75, 0.25, inExpo,  0,   'bgb-hu-Move'}
ease {25*4+3.50, 0.25, outExpo, 200, 'bgb-man-Move'}
ease {25*4+4.00, 0.25, inExpo,  0,   'bgb-man-Move'}

ease {29*4+2.75, 0.25, outExpo, 200, 'bgb-all-Move'}
ease {29*4+3.25, 0.25, inExpo,  0,   'bgb-all-Move'}
ease {29*4+3.00, 0.25, outExpo, 200, 'bgb-a-Move'}
ease {29*4+3.50, 0.25, inExpo,  0,   'bgb-a-Move'}
ease {29*4+3.25, 0.25, outExpo, 200, 'bgb-bout-Move'}
ease {29*4+3.75, 0.25, inExpo,  0,   'bgb-bout-Move'}
ease {29*4+3.50, 0.25, outExpo, 200, 'bgb-hu-Move'}
ease {29*4+4.00, 0.25, inExpo,  0,   'bgb-hu-Move'}

ease {31*4+0.50-0.25, 0.25, outExpo, 200, 'bgb-its-Move'}
ease {31*4+1.00-0.25, 0.25, inExpo,  0,   'bgb-its-Move'}
ease {31*4+0.75-0.25, 0.25, outExpo, 200, 'bgb-all-Move'}
ease {31*4+1.25-0.25, 0.25, inExpo,  0,   'bgb-all-Move'}
ease {31*4+1.25-0.25, 0.25, outExpo, 200, 'bgb-a-Move'}
ease {31*4+1.75-0.25, 0.25, inExpo,  0,   'bgb-a-Move'}
ease {31*4+1.50-0.25, 0.25, outExpo, 200, 'bgb-bout-Move'}
ease {31*4+2.00-0.25, 0.25, inExpo,  0,   'bgb-bout-Move'}
ease {31*4+2.00-0.25, 0.25, outExpo, 200, 'bgb-hu-Move'}
ease {31*4+2.50-0.25, 0.25, inExpo,  0,   'bgb-hu-Move'}
ease {31*4+2.25-0.25, 0.25, outExpo, 200, 'bgb-man-Move'}
ease {31*4+2.75-0.25, 0.25, inExpo,  0,   'bgb-man-Move'}
ease {31*4+2.75-0.25, 0.25, outExpo, 200, 'bgb-i-Move'}
ease {31*4+3.25-0.25, 0.25, inExpo,  0,   'bgb-i-Move'}
ease {31*4+3.00-0.25, 0.25, outExpo, 200, 'bgb-ty-Move'}
ease {31*4+3.50-0.25, 0.25, inExpo,  0,   'bgb-ty-Move'}

-- idk this file is becoming messy so Imma just put the mini and hidden region bit here
set {23*4, 200, 'tiny0', 200, 'tiny1', 200, 'tiny2', 200, 'tiny3', 100, 'invert', -PI*50, 'confusionzoffset0', -PI*50, 'confusionzoffset3', PI*50, 'confusionzoffset1', PI*50, 'confusionzoffset2'}
ease {23*4+2.00-0.125, .25, outExpo, 0, 'tiny2'}
ease {23*4+2.25-0.125, .25, outExpo, 0, 'tiny1'}
ease {23*4+2.75-0.125, .25, outExpo, 0, 'tiny0'}
ease {23*4+3.00-0.125, .25, outExpo, 0, 'tiny3'}
ease {23*4+3.50-0.125, .25, outQuad, 0, 'invert', 0, 'confusionzoffset0', 0, 'confusionzoffset3', 0, 'confusionzoffset1', 0, 'confusionzoffset2'}

ease {24*4-0.5, 1.0, inOutExpo,  35, 'rotatebg', -25, 'rotatePPy', -35, 'smoovePPx', 0, 'smoovebg',   0, 'movebgz'}
ease {26*4-1, 2.0, inOutExpo, -35, 'rotatebg',  25, 'rotatePPy',  35, 'smoovePPx', -70, 'smoovebg', -400, 'movebgz'}
ease {28*4-1, 2.0, inOutExpo,  35, 'rotatebg', -40, 'rotatePPy', -80, 'smoovePPx', 120, 'smoovebg', -600, 'movebgz'}
ease {30*4-1, 2.0, inOutExpo, -35, 'rotatebg',  70, 'rotatePPy',  80, 'smoovePPx', -180, 'smoovebg', -1000, 'movebgz'}--102
--DONT FORGET TO RESET THE SMOOVE!!!!
ease {31*4-1, 2.0, inOutExpo, 0, 'rotatebg',  0, 'rotatePPy',  0, 'smoovePPx', 0, 'smoovebg', 0, 'movebgz'}

ease {25*4-0.5, 1.0, inOutExpo,  20, 'rotatePx'}
ease {25*4+1.5, 1.0, inOutExpo,  00, 'rotatePx'}
ease {27*4-0.5, 1.0, inOutExpo,  20, 'rotatePx'}
ease {27*4+1.5, 1.0, inOutExpo,  00, 'rotatePx'}
ease {29*4-0.5, 1.0, inOutExpo,  20, 'rotatePx'}
ease {29*4+1.5, 1.0, inOutExpo,  00, 'rotatePx'}

--background pop
ease {31*4+1.25, 1.00, outCubic, -200, 'moovebgy'}
add  {31*4+2.25, 1.25, inQuad, 800, 'moovebgy'}

func {32*4, function()
	PPPAFTS:SetShader(tilesplz)
	TAFTS[1]:SetShader(tilesplz1)
	TAFTS[2]:SetShader(tilesplz2)
	TAFTS[3]:SetShader(tilesplz3)
	TAFTS[4]:SetShader(tilesplz4)
	PostPolishProxyParent:hidden(0)
	--these next 4 hiddens no longer do anything (see gridzMove)
	TAFTS[1]:hidden(0)
	TAFTS[2]:hidden(0)
	TAFTS[3]:hidden(0)
	TAFTS[4]:hidden(0)
	tilesplz:uniform1f('grid',10)
	tilesplz1:uniform1f('grid',10)
	tilesplz2:uniform1f('grid',10)
	tilesplz3:uniform1f('grid',10)
	tilesplz4:uniform1f('grid',10)
	PPPAFTS:zoom(10)
	TAFTS[1]:zoom(10)
	TAFTS[2]:zoom(10)
	TAFTS[3]:zoom(10)
	TAFTS[4]:zoom(10)
	BGQuad:diffuse(0,0,.5,1)
end}
ease {32*4, 30.0, inOutQuad, 3200, 'gridzMove'}
--This used to be -1600 x, 800 y. You're welcome.
ease {32*4, 32.0, inOutCubic, -900, 'gridScrollx'}
ease {36*4, 16.0, inOutQuad, 600, 'gridScrolly'}
func_ease {40*4-1.5, 1.5, linear, 3200, 0, function(p)
	-- this is the end bit z move to collapse the 5 planes onto each other
	PPPAFTS:z(-(p))
	TAFTS[1]:z((800-(p))*(p/3200))
	TAFTS[2]:z((1600-(p))*(p/3200))
	TAFTS[3]:z((2400-(p))*(p/3200))
	TAFTS[4]:z((3200-(p))*(p/3200))
end}
func {40*4, function()
	TAFTS[1]:hidden(1)
	TAFTS[2]:hidden(1)
	TAFTS[3]:hidden(1)
	TAFTS[4]:hidden(1)
	PPPAFTS:ClearShader()
	PPPAFTS:zoom(1)
	BGQuad:diffuse(1,0,1,0)
end}

--ease {32*4-1, 1.0, inOutExpo, 35, 'rotatebg', -37.5, 'rotatePPy'}
--ease {34*4-1, 2.0, inOutExpo, -35, 'rotatebg', 50, 'rotatePPy'}
--ease {36*4-1, 2.0, inOutExpo, 35, 'rotatebg', -50, 'rotatePPy'}
--ease {38*4-1, 2.0, inOutExpo, -35, 'rotatebg', 50, 'rotatePPy'}

--beat on main?!?!
set {24*4-0.5, 50, 'beat'}
set {31*4-0.5, 0, 'beat'}
set {32*4-0.5, 50, 'beat'}
set {39*4-0.5, 0, 'beat'}

set {(24*4)-0.25, 75, 'drunkperiod', 123, 'drunkspeed', 775, 'drunkspacing', 357, 'drunksize', 456, 'tipsyspeed', 169, 'tipsyspacing'}
swingle(24*4,0)
swingle(26*4,0)
swingle(28*4,0)
swingle(30*4,1)
--swingle on shader?!?!?!
swingle(32*4,0)
swingle(34*4,0)
swingle(36*4,0)
swingle(38*4,1)
