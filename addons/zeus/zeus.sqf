//	@file Version: 1.0
//	@file Name: zeus.sqf
//	@file Author: Wiking.at from Armajunkies.de
//	@file Description: Allow Zeus to interact with Objects on Map

if (!isServer) exitWith{};

//wait for world to initialize
sleep 60;

//get all the stuff on the map after load
{
	Module_Zeus1 addCuratorEditableObjects [[_x],true];
	Module_Zeus2 addCuratorEditableObjects [[_x],true];
	Module_Zeus3 addCuratorEditableObjects [[_x],true];
} foreach (allMissionObjects "All");


//get all players, ai and vehicles every 30 seconds
while {true} do {

sleep 30;

{
if ((side _x) == civilian || (side _x) == west || (side _x) == east || (side _x) == independent || (side _x) == sideEnemy) then
{
	Module_Zeus1 addCuratorEditableObjects [[_x],true];
	Module_Zeus2 addCuratorEditableObjects [[_x],true];
	Module_Zeus3 addCuratorEditableObjects [[_x],true];
};

}foreach allUnits;

/* Add also vehicles continously - not necessairy for Wasteland  - would have to check for performance impact.
Module_Zeus1 addCuratorEditableObjects [vehicles,true];
Module_Zeus2 addCuratorEditableObjects [vehicles,true];
Module_Zeus3 addCuratorEditableObjects [vehicles,true];
*/
};

