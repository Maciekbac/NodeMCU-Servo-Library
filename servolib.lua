module("servolib", package.seeall)

local MIN_PULSE = 35
local MAX_PULSE = 125 
local MIN_ANGLE = 0
local MAX_ANGLE = 180

function setup(pin)
	pwm.setup(pin, 50, angleToPulse(90))
	pwm.start(pin)
end

function setpos(pin, angle)
	if 	   angle < MIN_ANGLE then angle = MIN_ANGLE
	elseif angle > MAX_ANGLE then angle = MAX_ANGLE
	end
 	
	pwm.setduty(pin, angleToPulse(angle))
end

function angleToPulse(angle)
	return ((angle - MIN_ANGLE) * (MAX_PULSE - MIN_PULSE) / (MAX_ANGLE - MIN_ANGLE) + MIN_PULSE)
end

