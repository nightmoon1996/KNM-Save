# Player Data Saver for DarkRP
This script is a server-side script for Garry's Mod's DarkRP gamemode that saves player data to an SQL database. When a player connects, the script loads their data from the database and updates it whenever the player disconnects or the server shuts down.

## Features
* Saves player data (job, ammo, health, shield) to an SQLite database using the built-in sql module
* Uses hooks for PlayerInitialSpawn, PlayerDisconnected, and ShutDown to handle the loading and saving of player data
* Intended for use with DarkRP 2.7.0, but may work with other versions

## Installation
* Download the script and add it to your server's garrysmod/lua/autorun folder
* Make sure you have the built-in sql module installed on your server (included with Garry's Mod by default)
* Start or restart your server to load the script

## Credits
Made by KanameS (Ptlpp#7831)
Free to use, provided that credit is given
