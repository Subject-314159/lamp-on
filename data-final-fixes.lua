-- Get variables
local always_on = settings.startup["lo_always-on"].value
local darkness_on = settings.startup["lo_darkness-on"].value / 100
local darkness_off = settings.startup["lo_darkness-off"].value / 100
local tick_offset = 1 / 25000

-- Correct for precondition on > off
if not (darkness_on > darkness_off) then
    if darkness_off == 1 then
        -- If darkness off is 100% then we need to set darkenss_on to 100% and decrease darkness_off
        darkness_on = 1
        darkness_off = darkness_off - tick_offset
    else
        -- We need to set darkness_on to 1 tick offset above darkness_off
        darkness_on = darkness_off + tick_offset
    end
end

-- Loop through all lamps in data.raw
for _, lamp in pairs(data.raw["lamp"]) do
    if always_on or lamp.always_on then
        -- If either our setting is always on or the prototype is set to always on then leave it always on
        lamp.always_on = true
    else
        -- Update the darkness setting
        lamp.darkness_for_all_lamps_on = darkness_on
        lamp.darkness_for_all_lamps_off = darkness_off
    end
end
