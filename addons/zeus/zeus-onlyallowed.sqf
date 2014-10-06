
//	@file Version: 1.0
//	@file Name: zeus-onlyallowed.sqf
//	@file Author: Wiking.at from Armajunkies
//	@file Description: Restricts Zeus Slots to known Players



//run only on client
if (isServer) exitWith{}; 
// Zeus users - allowed to use Zeus slots
_zeusUIDs =[
		// Put player UIDs here
		"76561198058098139", //Moros
		"76561197960315007", //JOe
		"76561197970396192", //Wiking
		"76561197969673156", //Xerxio
		"76561198054115496"  //Staynex
		
	];


// kick Player back to Lobby if Zeus and not a known player
if ((str(side player) == "LOGIC") && !(getPlayerUID player in _zeusUIDs)) then { 
//hint "Failmission";
failMission "LOSER"; 
};
	
	
	




