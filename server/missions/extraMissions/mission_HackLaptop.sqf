// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HackLaptop.sqf
//	@file Author: JoSchaap, AgentRev, LouD

if (!isServer) exitwith {};
#include "extraMissionDefines.sqf";

private ["_bunker", "_laptop", "_obj", "_randomGroup", "_vehicleName", "_obj1", "_obj2", "_obj3", "_obj4", "_obj5", "_obj6", "_obj7", "_obj8", "_obj9"];

_setupVars =
{
	_missionType = "Enemy Laptop";

	_locationsArray = MissionSpawnMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	_bunker = createVehicle ["Land_BagBunker_Small_F", [_missionPos select 0, _missionPos select 1], [], 0, "CAN COLLIDE"];

	_missionPos = getPosASL _bunker;

	_laptop = createVehicle ["Land_Laptop_unfolded_F", _missionPos, [], 0, "CAN COLLIDE"];
	_laptop setPosASL [_missionPos select 0, (_missionPos select 1) - 0.25, _missionPos select 2];

	_obj = createVehicle ["I_HMG_01_high_F", _missionPos,[], 10,"None"]; 
	_obj setPosASL [_missionPos select 0, (_missionPos select 1) + 2, _missionPos select 2];

		//Additional objects placed by Chappy

_obj1 = createVehicle ["Land_Cargo_HQ_V1_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj1 setPosATL [(_missionPos select 0) + 11.0, (_missionPos select 1) + 0, -0.5];
_obj1 setDir 270;
_obj1 allowDamage false;

_obj2 = createVehicle ["Land_Cargo_HQ_V1_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj2 setPosATL [(_missionPos select 0) - 11.0, (_missionPos select 1) + 0, -0.5];
_obj2 setDir 90;
_obj2 allowDamage false;

_obj3 = createVehicle ["Land_Cargo_HQ_V1_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj3 setPosATL [(_missionPos select 0) + 0, (_missionPos select 1) + 11.0, -0.5];
_obj3 setDir 180;
_obj3 allowDamage false;

_obj4 = createVehicle ["Land_Cargo_HQ_V1_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj4 setPosATL [(_missionPos select 0) + 0.0, (_missionPos select 1) - 11.0, -0.5];
_obj4 setDir 0;
_obj4 allowDamage false;

_obj5 = createVehicle ["I_HMG_01_high_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj5 setPosATL [(_missionPos select 0) + 10.0, (_missionPos select 1) + 6.2, +4.0];
_obj5 setDir 90;
_obj5 allowDamage false;

_obj6 = createVehicle ["I_GMG_01_high_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj6 setPosATL [(_missionPos select 0) - 10.0, (_missionPos select 1) - 6.2, +4.0];
_obj6 setDir 90;
_obj6 allowDamage false;

_obj7 = createVehicle ["I_HMG_01_high_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj7 setPosATL [(_missionPos select 0) - 7.2, (_missionPos select 1) + 10.0, +4.0];
_obj7 setDir 270;
_obj7 allowDamage false;

_obj8 = createVehicle ["I_static_AA_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj8 setPosATL [(_missionPos select 0) + 1.0, (_missionPos select 1) + 12.0, +4.0];
_obj8 setDir 0;
_obj8 allowDamage false;

_obj9 = createVehicle ["Land_BagBunker_Small_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj9 setPosATL [(_missionPos select 0) - 0.5, (_missionPos select 1) + 0.0, +0.1];
_obj9 setDir 0;
_obj9 allowDamage false;


	
	AddLaptopHandler = _laptop;
	publicVariable "AddLaptopHandler";

	_laptop setVariable [ "Done", false, true ];

	// NPC Randomizer 
	_randomGroup = [createGroup1,createGroup2,createGroup3,createGroup4,createGroup5] call BIS_fnc_selectRandom;
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos] spawn _randomGroup;

	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";	

	_vehicleName = "Laptop";
	_missionHintText = format ["A <t color='%2'>%1</t> with enemy bank accounts has been spotted, go hack it.", _vehicleName, extraMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec =
{
	AddLaptopHandler = _laptop;
	publicVariable "AddLaptopHandler";
};
_waitUntilCondition = nil;
_waitUntilSuccessCondition = { _laptop getVariable ["Done", false] };
_ignoreAiDeaths = true;

_failedExec =
{
	// Mission failed
	RemoveLaptopHandler = _laptop;
	publicVariable "RemoveLaptopHandler";
	{ deleteVehicle _x } forEach [_bunker, _obj, _laptop, _obj1, _obj2, _obj3, _obj4, _obj5, _obj6, _obj7, _obj8, _obj9];
};

_successExec =
{
	// Mission completed
	RemoveLaptopHandler = _laptop;
	publicVariable "RemoveLaptopHandler";
	{ deleteVehicle _x } forEach [_bunker, _laptop];
	
	_obj setVariable ["R3F_LOG_disabled", false, true];
	_obj1 setVariable ["R3F_LOG_disabled", false, true]; 
	 _obj2 setVariable ["R3F_LOG_disabled", false, true];
	 _obj3 setVariable ["R3F_LOG_disabled", false, true];
	 _obj4 setVariable ["R3F_LOG_disabled", false, true];	
	 _obj5 setVariable ["R3F_LOG_disabled", false, true];	 
	 _obj6 setVariable ["R3F_LOG_disabled", false, true];	 
	 _obj7 setVariable ["R3F_LOG_disabled", false, true]; 	 
	 _obj8 setVariable ["R3F_LOG_disabled", false, true];	 
	 _obj9 setVariable ["R3F_LOG_disabled", false, true];
	

	_successHintMessage = format ["The laptop is hacked and the smugglers are dead. The weapons and money are yours!"];
};

_this call extraMissionProcessor;