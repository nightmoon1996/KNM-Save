// this script is made by KanameS (Ptlpp#7831) and you can use it for free but you have to credit me if you edit it
// this script is made for darkrp 2.7.0 and it may not work on other versions

if not SERVER then return end

local function savePlayer(ply)
    local job = ply:Team()
    local money = ply:getDarkRPVar("money")
    local hp = ply:Health()
    local shield = ply:getDarkRPVar("Energy")
    local ammo = ply:GetAmmoCount("pistol")
    local steamid = ply:SteamID64()
    local query = "INSERT INTO knm_save (steamid, job, money, hp, shield, ammo) VALUES ('"..steamid.."', '"..job.."', '"..money.."', '"..hp.."', '"..shield.."', '"..ammo.."') ON DUPLICATE KEY UPDATE job = '"..job.."', money = '"..money.."', hp = '"..hp.."', shield = '"..shield.."', ammo = '"..ammo.."'" -- this is the query that saves the player's data
    sql.Query(query)

    print(ply:Nick().." has been saved!")
end

local function loadPlayer(ply)
    local steamid = ply:SteamID64()
    local query = "SELECT * FROM knm_save WHERE steamid = '"..steamid.."'" -- this is the query that loads the player's data
    local result = sql.Query(query)

    if result then
        local job = result[1].job
        local money = result[1].money
        local hp = result[1].hp
        local shield = result[1].shield
        local ammo = result[1].ammo

        ply:setDarkRPVar("money", money)
        ply:SetHealth(hp)
        ply:setDarkRPVar("Energy", shield)
        ply:SetAmmo(ammo, "pistol")
        ply:changeTeam(job, true, true)

        print(ply:Nick().." has been loaded!")
    end
end

hook.Add("PlayerInitialSpawn", "knm_save", function(ply)
    loadPlayer(ply)
end)

hook.Add("PlayerDisconnected", "knm_save", function(ply)
    savePlayer(ply)
end)

hook.Add("ShutDown", "knm_save", function()
    for k, v in pairs(player.GetAll()) do
        savePlayer(v)
    end
end)

timer.Create("knm_save", 300, 0, function()
    for k, v in pairs(player.GetAll()) do
        savePlayer(v)
    end
end)