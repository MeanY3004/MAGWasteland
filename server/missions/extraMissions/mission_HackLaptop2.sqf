// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HackLaptop.sqf
//	@file Author: JoSchaap, AgentRev, LouD

if (!isServer) exitwith {};
#include "extraMissionDefines.sqf";

private ["_bunker", "_laptop", "_obj", "_aiGroup2", "_randomGroup", "_randomGroup2", "_vehicleName", "_obj1", "_obj2", "_obj3", "_obj4", "_obj5", "_obj6", "_obj7", "_obj8", "_obj9", "_obj10", "_obj11", "_obj12", "_obj13", "_obj14", "_obj15", "_obj16", "_obj17", "_obj18"];

_setupVars =
{
	_missionType = "Enemy Laptop";

	_locationsArray = MissionSpawnMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	_bunker = createVehicle ["Land_runway_edgelight", [_missionPos select 0, _missionPos select 1], [], 0, "CAN COLLIDE"];

	_missionPos = getPosASL _bunker;

	_laptop = createVehicle ["Land_Laptop_unfolded_F", _missionPos, [], 0, "CAN COLLIDE"];
	_laptop setPosASL [_missionPos select 0, (_missionPos select 1) - 0.25, _missionPos select 2];

	//_obj = createVehicle ["I_HMG_01_high_F", _missionPos,[], 10,"None"]; 
	//_obj setPosASL [_missionPos select 0, (_missionPos select 1) + 2, _missionPos select 2];

		//Additional objects placed by Chappy

_obj1 = createVehicle ["Land_BagBunker_Tower_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj1 setPosATL [(_missionPos select 0) - 1.0, (_missionPos select 1) + 0.5, 0.1];
_obj1 setDir 90;
_obj1 allowDamage false;

_obj2 = createVehicle ["Land_BagBunker_Large_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj2 setPosATL [(_missionPos select 0) + 3.0, (_missionPos select 1) + 11.0, 0.1];
_obj2 setDir 180;
_obj2 allowDamage false;
_obj3 = createVehicle ["Land_BagBunker_Tower_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj3 setPosATL [(_missionPos select 0) + 10, (_missionPos select 1) + 7.0, 0.1];
_obj3 setDir 180;
_obj3 allowDamage false;
_obj4 = createVehicle ["Land_BagBunker_Large_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj4 setPosATL [(_missionPos select 0) - 4.0, (_missionPos select 1) - 11.0, 0.1];
_obj4 setDir 0;
_obj4 allowDamage false;
_obj5 = createVehicle ["Land_BagBunker_Tower_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj5 setPosATL [(_missionPos select 0) - 11.0, (_missionPos select 1) - 6.5, 0.1];
_obj5 setDir 0;
_obj5 allowDamage false;
_obj6 = createVehicle ["Land_BagBunker_Large_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj6 setPosATL [(_missionPos select 0) - 13.0, (_missionPos select 1) + 2.0, 0.1];
_obj6 setDir 90;
_obj6 allowDamage false;
_obj7 = createVehicle ["Land_BagBunker_Tower_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj7 setPosATL [(_missionPos select 0) - 8.5, (_missionPos select 1) + 10.0, 0.1];
_obj7 setDir 90;
_obj7 allowDamage false;
_obj8 = createVehicle ["Land_BagBunker_Large_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj8 setPosATL [(_missionPos select 0) + 12.0, (_missionPos select 1) + 2.0, 0.1];
_obj8 setDir 270;
_obj8 allowDamage false;
_obj9 = createVehicle ["Land_BagBunker_Tower_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj9 setPosATL [(_missionPos select 0) + 8.0, (_missionPos select 1) - 9.0, 0.1];
_obj9 setDir 270;
_obj9 allowDamage false;
_obj10 = createMine ["APERSBoundingMine", _missionPos,[], 0]; 
_obj10 setPosATL [(_missionPos select 0) + 6.0, (_missionPos select 1) - 15.0, 0.0];
_obj10 setDir 0;

_obj11 = createMine ["APERSBoundingMine", _missionPos,[], 0]; 
_obj11 setPosATL [(_missionPos select 0) - 7.0, (_missionPos select 1) - 20.0, 0.0];
_obj11 setDir 0;

_obj12 = createVehicle ["Land_HBarrier_5_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj12 setPosATL [(_missionPos select 0) - 1.0, (_missionPos select 1) - 20.0, 0.1];
_obj12 setDir 0;

_obj13 = createVehicle ["Land_HBarrier_5_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj13 setPosATL [(_missionPos select 0) - 5.0, (_missionPos select 1) + 20.0, 0.1];
_obj13 setDir 0;

_obj14 = createVehicle ["I_HMG_01_high_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj14 setPosATL [(_missionPos select 0) - 14.4, (_missionPos select 1) + 4.3, 0.1];
_obj14 setDir 180;

_obj15 = createVehicle ["I_HMG_01_high_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj15 setPosATL [(_missionPos select 0) - 2.0, (_missionPos select 1) - 13.0, 0.1];
_obj15 setDir 0;

_obj16 = createVehicle ["I_static_AA_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj16 setPosATL [(_missionPos select 0) + 10.0, (_missionPos select 1) + 5.5, 3.0];
_obj16 setDir 270;

_obj17 = createVehicle ["I_static_AA_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj17 setPosATL [(_missionPos select 0) - 11.0, (_missionPos select 1) + 5.0, 3.0];
_obj17 setDir 90;

_obj18 = createVehicle ["I_GMG_01_high_F", _missionPos,[], 0,"CAN COLLIDE"]; 
_obj18 setPosATL [(_missionPos select 0) + 1.5, (_missionPos select 1) + 0.5, 3.0];
_obj18 setDir 0;



	
	AddLaptopHandler = _laptop;
	publicVariable "AddLaptopHandler";

	_laptop setVariable [ "Done", false, true ];

	// NPC Randomizer 
	_randomGroup = [createGroup1,createGroup2,createGroup3,createGroup4,createGroup5] call BIS_fnc_selectRandom;
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos] spawn _randomGroup;

	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";	
	
	_randomGroup2 = [createGroup1,createGroup2,createGroup3,createGroup4,createGroup5] call BIS_fnc_selectRandom;
	_aiGroup2 = createGroup CIVILIAN;
	[_aiGroup2,_missionPos] spawn _randomGroup2;

	_aiGroup2 setCombatMode "RED";
	_aiGroup2 setBehaviour "COMBAT";	
	

	_vehicleName = "Laptop";
	_missionHintText = format ["A <t color='%2'>%1</t> with enemy bank accounts has been spotted, go hack it. BEWARE THE MINE FIELD! The proceeds from this mission are taken from player bank accounts", _vehicleName, extraMissionColor];
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
	{ deleteVehicle _x } forEach [_bunker, _laptop, _obj1, _obj2, _obj3, _obj4, _obj5, _obj6, _obj7, _obj8, _obj9, _obj10, _obj11, _obj12, _obj13, _obj14, _obj15, _obj16, _obj17, _obj18];
};

_successExec =
{
	// Mission completed
	RemoveLaptopHandler = _laptop;
	publicVariable "RemoveLaptopHandler";
	{ deleteVehicle _x } forEach [_bunker, _laptop];
	
	_obj1 setVariable ["R3F_LOG_disabled", false, true];
	 _obj2 setVariable ["R3F_LOG_disabled", false, true];
	 _obj3 setVariable ["R3F_LOG_disabled", false, true];
	 _obj4 setVariable ["R3F_LOG_disabled", false, true];
	 _obj5 setVariable ["R3F_LOG_disabled", false, true];
	 _obj6 setVariable ["R3F_LOG_disabled", false, true];
	 _obj7 setVariable ["R3F_LOG_disabled", false, true]; 
	 _obj8 setVariable ["R3F_LOG_disabled", false, true];
	 _obj9 setVariable ["R3F_LOG_disabled", false, true];
	 _obj10 setVariable ["R3F_LOG_disabled", false, true];
	 _obj11 setVariable ["R3F_LOG_disabled", false, true];
	 _obj12 setVariable ["R3F_LOG_disabled", false, true];
	 _obj13 setVariable ["R3F_LOG_disabled", false, true];
	 _obj14 setVariable ["R3F_LOG_disabled", false, true];
	 _obj15 setVariable ["R3F_LOG_disabled", false, true];
	 _obj16 setVariable ["R3F_LOG_disabled", false, true];
	 _obj17 setVariable ["R3F_LOG_disabled", false, true];
	 _obj18 setVariable ["R3F_LOG_disabled", false, true];

	_successHintMessage = format ["The laptop is hacked and the smugglers are dead. The weapons and money are yours!"];
};

_this call extraMissionProcessor;