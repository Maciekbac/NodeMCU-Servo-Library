--servolib example program
PIN = 1
move = 5 -- direction and speed of servo movement
angle = 0

servo = require 'servolib'
servo.setup(PIN)

tmr.alarm(0,100,tmr.ALARM_AUTO,function()
    angle = angle + move
    if angle > 180 then
        angle = 180
        move = move * -1
    elseif angle < 0 then
        angle = 0
        move = move * -1
    end
    servo.setpos(PIN,angle)
end)
