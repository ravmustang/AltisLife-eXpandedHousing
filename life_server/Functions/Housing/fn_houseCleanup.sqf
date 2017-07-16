/*
    File: fn_houseCleanup.sqf
    Author: NiiRoZz

    Description:
    Cleans up containers inside in house of player.
*/
private ["_query","_containers"];
_query = format ["SELECT pid, pos FROM containers WHERE pid='%1' AND owned='1'",_this];

_containers = [_query,2,true] call DB_fnc_asyncCall;

if (count _containers isEqualTo 0) exitWith {};
{
    _pos = call compile format ["%1",_x select 1];
    _lifeContainers = getArray(missionConfigFile >> "CfgDonkeyPunchCustoms" >> "LifeContainers");
	_lifeFurniture = getArray(missionConfigFile >> "CfgDonkeyPunchCustoms" >> "BuildableFurniture");
	_lifeContainers = _lifeContainers + _lifeFurniture;
	_container = nearestObjects[_pos,_lifeContainers,15];
    {
        deleteVehicle _x;
    } forEach _container;
} forEach _containers;
