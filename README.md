# ESX txAdmin Ban & Kick Logger

A simple and reliable **txAdmin integration** for logging **ban** and **kick** events in a FiveM server.  
Automatically sends styled messages to **Discord** and in-game notifications to all players.

## Features

- Listens to `txAdmin:events:playerBanned` and `txAdmin:events:playerKicked` events
- Sends **formatted embed messages** to a Discord webhook
- Triggers global in-game **notifications** for bans and kicks
- Timestamps included in the Discord embed
- Color-coded messages (Red for bans, Orange for kicks)
- Prints event data to server console for debugging

## Discord Logging

All events are sent to a pre-configured **Discord webhook** with:

- Player name
- Admin name
- Reason for ban/kick
- Timestamp (UTC)

## Author
Created by **Kilian**
