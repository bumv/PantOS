local component = require("component")
local keyboard = require("keyboard")
print("Press Ctrl+W to stop")
local driveList = {}
for k,v in component.list() do
    if v == "tape_drive" then
        table.insert(driveList, k)
    end
end
while true do
    local tempaddress = driveList[math.random(#driveList)]
    os.execute("tape rewind --address='" .. tempaddress .. "'")
    os.execute("tape play --address='" .. tempaddress .. "'")
    for i = 1, 240, 1 do
        if keyboard.isKeyDown(keyboard.keys.w) and keyboard.isControlDown() then
            os.exit()
        end
        os.sleep(1)
    end
    os.execute("tape rewind --address='" .. tempaddress .. "'")
end

