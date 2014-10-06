Zeus-Addon-A3Wasteland
======================

Addon by wiking.at | www.armajunkies.de | ts3.armajunkies.de

Steps to install:

- Place the contents of the attached addons folder to your addons folder. Edit zeus-onlyallowed.sqf to include the Player UID's of players who should be allowed to use the zeus slots.

- Merge the attached mission.sqm with your mission.sqm using the Arma 3 Editor "Merge" Feature (DO NOT replace it).

- Modify your init.sqf to reflect the changes in the Lines 43-44 and 71-81:
https://github.com/wiking-at/Zeus-Addon-A3Wasteland/blob/master/init.sqf#L43-L44
https://github.com/wiking-at/Zeus-Addon-A3Wasteland/blob/master/init.sqf#L71-L81

- Zeus created units get deleted by the missions Anti-Hack. If you want to create units as Zeus you have to comment out this check:
https://github.com/A3Wasteland/ArmA3_Wasteland.Altis/blob/revive_beta/server/antihack/serverSide.sqf#L18-L50
To do this place /* before and */ after this code block. Be aware that the deactivation of this check opens some possiblities for script kiddies.

- To be sure your savegame used for the playerslot isn't getting corrupted by your Zeus usage you can disable saving for zeus units. Add Line 6 to do this:
https://github.com/wiking-at/Zeus-Addon-A3Wasteland/blob/master/persistence/players/c_savePlayerData.sqf#L6


Limitations and Bugs:
- The usage of the addon may impact your server performance/network traffic as the BIS Curator Module introduces additional network traffic

- The player and admin-menu's are not working 100%. I just enabled this functionality to be able to change the view distance and do basic admin tasks. As an example - if you drop money as Zeus it is dropped on the position of your curator logic and not at the unit you are controlling.
