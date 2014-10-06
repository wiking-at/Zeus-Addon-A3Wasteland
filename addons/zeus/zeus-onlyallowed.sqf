
//	@file Version: 1.0
//	@file Name: zeus-onlyallowed.sqf
//	@file Author: Wiking.at from Armajunkies
//	@file Description: Restricts Zeus Slots to known Players



//run only on client
if (isServer) exitWith{}; 
// Zeus users - allowed to use Zeus slots
_zeusUIDs =[
		// Put player UIDs here
		"765xxxx", //Admin1
		"765xxx",  //Admin2
		"765xxx"   //Admin 3		
	];


// kick Player back to Lobby if Zeus and not a known player
if ((str(side player) == "LOGIC") && !(getPlayerUID player in _zeusUIDs)) then { 
//hint "Failmission";
failMission "LOSER"; 
};
	
	
	




