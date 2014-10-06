																																																												asaerw3rw3r4 = 1; Menu_Init_Lol = 1;
//	@file Version: 1.2
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap
//	@file Description: The main init.

#define DEBUG false

enableSaving [true, true];

currMissionDir = compileFinal str call
{
	private "_arr";
	_arr = toArray str missionConfigFile;
	_arr resize (count _arr - 15);
	toString _arr
};

X_Server = false;
X_Client = false;
X_JIP = false;

// versionName = ""; // Set in STR_WL_WelcomeToWasteland in stringtable.xml

if (isServer) then { X_Server = true };
if (!isDedicated) then { X_Client = true };
if (isNull player) then { X_JIP = true };

A3W_scriptThreads = [];

[DEBUG] call compile preprocessFileLineNumbers "globalCompile.sqf";

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "storeConfig.sqf"; // Separated as its now v large
[] execVM "briefing.sqf";

if (!isDedicated) then
{
	[] spawn
	{
		waitUntil {!isNull player};
		[] execVM "addons\zeus\zeus-onlyallowed.sqf"; //Zeus  - kick unknown users
		if (str(side player) == "LOGIC") exitWith {}; //zeus needs no wasteland client init
		9999 cutText ["Welcome to A3Wasteland, please wait for your client to initialize", "BLACK", 0.01];
		removeAllWeapons player;
		client_initEH = player addEventHandler ["Respawn", { removeAllWeapons (_this select 0) }];

		// Reset group & side
		[player] joinSilent createGroup playerSide;
		player setVariable ["playerSpawning", true, true];

		[] execVM "client\init.sqf";
	};
};

if (isServer) then
{
	diag_log format ["############################# %1 #############################", missionName];
	diag_log "WASTELAND SERVER - Initializing Server";
	[] execVM "server\init.sqf";
};

//init 3rd Party Scripts - Running on Server and all Clients:
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
[] execVM "addons\proving_ground\init.sqf";
[] execVM "addons\scripts\DynamicWeatherEffects.sqf";
[] execVM "addons\JumpMF\init.sqf";


if (isServer) then
{
//init Zeus Server Scripts - used to give Zeus Modules Permissions to objects
[] execVM "addons\zeus\zeus.sqf";
};

if (str(side player) == "LOGIC") then
{
//init for Zeus to Allow A3wasteland Admin Menü, Player Menu, (n ...
[] execVM "addons\zeus\zeus-init.sqf";
};
