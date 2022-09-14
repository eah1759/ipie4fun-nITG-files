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
    PP[pn]:SetTarget(P[pn])
    P[pn]:hidden(1)
end
-- your code goes here here:

setdefault {2, 'xmod', 100, 'dizzyholds'}--, 100, 'arrowpath'}

P[1]:x(SCREEN_CENTER_X)
P[2]:x(SCREEN_CENTER_X)

--SKEWWWW
ease {0, 0.75, outQuart, 25, 'skewx'}
ease {1, 0.75, outQuart, -25, 'skewx'}
ease {2, 0.75, outQuart, 25, 'skewx'}
ease {3, 0.75, outQuart, -25, 'skewx'}
ease {4.25, 0.5, outCubic, 0, 'skewx'}

--Funny hidden creep
set  {4.5, 1000, 'hidden', -15, 'hiddenoffset'}
add  {4.5, 1, linear, -64, 'hiddenoffset'}
set  {5.5, 75, 'hiddenoffset'}
add  {5.5, 1, linear, -64, 'hiddenoffset'}
set  {6.5, 400, 'hiddenoffset'}
set  {8, 0, 'hidden', 0, 'hiddenoffset'}

--bruh I don't even
func {8, function()
	PP[2]:y(-400)
end}
set  {8, 400, 'sudden', plr=2}
ease {8, 1, linear, 360, 'suddenoffset', plr=2}
func_ease{9, 3, linear, 0, 100, function(p)
	PP[1]:y(400*(p/100))
	PP[2]:y((400*(p/100))-400)
end}
func {12, function()
	PP[1]:y(0)
	PP[2]:y(0)
end}

--scar
ease {16.00, 0.25, inOutCubic, -50, 'split', -50, 'cross', -50, 'alternate', 100, 'reverse'}
ease {16.25, 0.25, inOutCubic, 0, 'split', -100, 'cross', 0, 'alternate', 100, 'reverse'}
ease {16.50, 0.25, inOutCubic, -50, 'split', -50, 'cross', 50, 'alternate', 100, 'reverse'}
ease {16.75, 0.25, inOutCubic, -100, 'split', 0, 'cross', 0, 'alternate', 100, 'reverse'}
ease {17.00, 0.25, inOutCubic, -50, 'split', 50, 'cross', -50, 'alternate', 100, 'reverse'}
ease {17.25, 0.25, inOutCubic, 0, 'split', 0, 'cross', -100, 'alternate', 100, 'reverse'}
ease {17.50, 0.25, inOutCubic, 50, 'split', 50, 'cross', -50, 'alternate', 0, 'reverse'}
ease {17.75, 0.5, inCubic, 0, 'split', 0, 'cross', 0, 'alternate', 100, 'reverse'}

--flicker
func {0,function()
  P[1]:SetHiddenRegions({{16,20},{24,28}})
  P[2]:SetHiddenRegions({{20,24}})
end}
flick = 1
perframe{16, 8, function(beat, popt)
	flick = flick*(-1)
	popt[1].tiny0 = 100*(flick+1)
	popt[1].tiny2 = 100*(flick+1)
	popt[1].tiny1 = (flick-1)*(-100)
	popt[1].tiny3 = (flick-1)*(-100)

	popt[1].parabolax = ((-800)*(flick+1)) + ((flick-1)*(-800))
end}

--column swaps
ease {24.00, 0.25, linear, 25, 'flip', 125, 'invert'}
ease {24.67, 0.25, linear, 75, 'flip', 75, 'invert'}
ease {25.33, 0.25, linear, 0, 'flip', 100, 'invert'}
ease {26.00, 0.25, linear, 25, 'flip', -75, 'invert'}
ease {27.00, 0.25, linear, 0, 'flip', 0, 'invert'}

--SHPEEEEEEN
func_ease {28, 2, inOutCirc, 0, 100, function(p)
	PP[1]:rotationz((p/100)*180)
	PP[2]:rotationz((p/100)*180)
	PP[1]:xy(DISPLAY:GetDisplayWidth()*(p/100), DISPLAY:GetDisplayHeight()*(p/100))
	PP[2]:xy(DISPLAY:GetDisplayWidth()*(p/100), DISPLAY:GetDisplayHeight()*(p/100))
end}

--ZOOOOOOOOM
set  {29, 1, 'zigzagzperiod'}
set  {29, 64, 'zigzagzoffset', plr=2}
ease {29.5, 2.5, linear, -300, 'noteskewx0', -1700, 'tiny0', 1500, 'zigzagz'}
