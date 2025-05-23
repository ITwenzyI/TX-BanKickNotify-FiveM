function sendToDiscord(title, description, color)
    local webhookURL = "https://discord.com/api/webhooks/"  -- Discord Webhook URL

    local embed = {
        ["embeds"] = { {
            ["title"] = title,
            ["description"] = description,
            ["color"] = color,
            ["fields"] = {
                {
                    ["name"] = "⏰ Time",
                    ["value"] = os.date("!%d.%m.%Y - %H:%M:%S"),
                    ["inline"] = false
                }
            }
        } }
    }

    PerformHttpRequest(webhookURL, function(err, text, headers)
        if err == 200 then
            print("Webhook sent successfully.")
        else
            print("Error sending webhook: " .. err)
        end
    end, 'POST', json.encode(embed), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('txAdmin:events:playerBanned', function(eventData)
    print("Ban Event Data: " .. json.encode(eventData))
    local playerName = eventData.targetName  
    local message = string.format(
        "👤 **Player:** `%s`\n🛑 **Banned by:** `%s`\n⚠️ **Reason:** `%s`", 
        playerName, eventData.author, eventData.reason
    )

    TriggerClientEvent('notifications', -1, '#FF0000', 'Server - Ban', eventData.author .. ' has banned ' .. playerName .. ' from the server!', 10000)
    sendToDiscord("🚨 Ban Notification", message, 16711680)  -- Red
end)

AddEventHandler('txAdmin:events:playerKicked', function(eventData)
    local playerName = GetPlayerName(eventData.target)  
    local message = string.format(
        "👤 **Player:** `%s`\n🚀 **Kicked by:** `%s`\n📌 **Reason:** `%s`", 
        playerName, eventData.author, eventData.reason
    )

    TriggerClientEvent('notifications', -1, '#eb8034', 'Server - Kick', eventData.author .. ' has kicked ' .. playerName .. ' from the server!', 10000)
    sendToDiscord("⚠️ Kick Notification", message, 16753920)  -- Orange
end)
