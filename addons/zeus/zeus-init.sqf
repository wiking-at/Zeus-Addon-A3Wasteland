//Add Additonal Wasteland Features zu Zeus Players


//Custom Function Compile for Zeus:
//call compile preprocessFileLineNumbers "client\functions\clientCompile.sqf";
onKeyPress = "client\clientEvents\onKeyPress.sqf" call mf_compile;
findHackedVehicles = "client\systems\adminPanel\findHackedVehicles.sqf" call mf_compile;
isAdmin = "client\systems\adminPanel\isAdmin.sqf" call mf_compile;
updateTerritoryMarkers = "territory\client\updateTerritoryMarkers.sqf" call mf_compile;
fn_resupplytruck = "client\functions\fn_resupplytruck.sqf" call mf_compile;
updateMissionsMarkers = "client\functions\updatePlayerMissionMarkers.sqf" call mf_compile;
updateRadarMarkers = "client\functions\updatePlayerRadarMarkers.sqf" call mf_compile;
updateTeamKiller = "client\functions\updateTeamKiller.sqf" call mf_compile;
applyVehicleTexture = "client\systems\vehicleStore\applyVehicleTexture.sqf" call mf_compile;
loadPlayerMenu = "client\systems\playerMenu\init.sqf" call mf_compile;
if (isNil "TPG_fnc_MP") then { TPG_fnc_MP = "\A3\functions_f\MP\fn_MP.sqf" call mf_compile };
if (isNil "TPG_fnc_MPexec") then { TPG_fnc_MPexec = "\A3\functions_f\MP\fn_MPexec.sqf" call mf_compile };


waitUntil {!isNull findDisplay 46};
(findDisplay 46) displayAddEventHandler ["KeyDown", onKeyPress];

[] spawn
{
	call compile preprocessFileLineNumbers "client\functions\createTownMarkers.sqf"; // wait until town markers are placed before adding others
	[] execVM "client\functions\createGunStoreMarkers.sqf";
	[] execVM "client\functions\createGeneralStoreMarkers.sqf";
	[] execVM "client\functions\createVehicleStoreMarkers.sqf";
	//AJ Basemarkers
	[] execVM "client\functions\createBaseMarkers.sqf";
};

[] execVM "addons\fpsFix\vehicleManager.sqf";