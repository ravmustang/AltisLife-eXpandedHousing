#include "..\..\script_macros.hpp"
/*
    File : fn_placestorage.sqf
    Author: NiiRoZz

    Description:
    PLace container were player select with preview

*/
private ["_container","_isFloating"];

if (!life_container_active) exitWith {};
if (life_container_activeObj == objNull) exitWith {};
_lifeContainers = getArray(missionConfigFile >> "CfgDonkeyPunchCustoms" >> "LifeContainers");
_lifeFurniture = getArray(missionConfigFile >> "CfgDonkeyPunchCustoms" >> "BuildableFurniture");
_lifeContainers = _lifeContainers + _lifeFurniture;
if (!((typeOf life_container_activeObj) in _lifeContainers)) exitWith {};

_container = life_container_activeObj;
_isFloating = if (((getPos _container) select 2) < 0.1) then {false} else {true};
detach _container;
_furniture = getArray(missionConfigFile >> "CfgDonkeyPunchCustoms" >> "BuildableFurniture");
if((typeOf _container) in _furniture)then
{
	[_container,false] remoteExecCall ["life_fnc_simDisable",RANY];
	_container setPosATL [getPosATL _container select 0, getPosATL _container select 1, (getPosATL _container select 2)];
	_container enableSimulationGlobal false;
}else{
	[_container,true] remoteExecCall ["life_fnc_simDisable",RANY];
	_container setPosATL [getPosATL _container select 0, getPosATL _container select 1, (getPosATL _container select 2) + 0.7];
};
_container allowDamage false;

_lifeHandleInv = getText(missionConfigFile >> "CfgDonkeyPunchCustoms" >> (typeOf _container));
[false,_lifeHandleInv,1] call life_fnc_handleInv;

[_container, _isFloating] call life_fnc_placeContainer;
life_container_active = false;
life_container_activeObj = objNull;