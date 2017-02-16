#include "..\..\script_macros.hpp"
/*
    File: fn_placeContainer.sqf
    Author: NiiRoZz
    Credits: BoGuu

    Description:
    Check container if are in house and if house are owner of player and if all this conditions are true add container in database
*/
private ["_container","_isFloating","_type","_house","_containers","_houseCfg","_message","_isPlaced"];
params [
        ["_container",objNull,[objNull]],
        ["_isFloating",true,[true]]
];

_uid = getPlayerUID player;
_house = nearestObject [player, "House"];

BuildPosX = 0;BuildPosY = 2;BuildPosZ = 1;BuildVecYaw = 0;BuildVecPitch = 0;BuildVecRoll = 0;
(findDisplay 46) displayRemoveEventHandler ["KeyDown", keyDownEHId];
_type = "";
_type = getText(missionConfigFile >> "CfgDonkeyPunchCustoms" >> (typeOf _container));

_message = 0;
_isPlaced = false;
if (!isNull _house) then {
    _message = 1;
    if (([player] call life_fnc_playerInBuilding) && ((_container distance _house) < 15))then {	//
        _message = 2;
        if ((_house in life_vehicles) && !(isNil {_house getVariable "house_owner"})) then {
            _message = 3;
            if ((!_isFloating) || ((getNumber(missionConfigFile >> "VirtualItems" >> _type >> "furniture")) isEqualTo 1)) then {
                _message = 4;
                _containers = _house getVariable ["containers",[]];
				_furnitures = _house getVariable ["furnitures",[]];
                _houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
                if (_houseCfg isEqualTo []) exitWith {};
				if !((getNumber(missionConfigFile >> "VirtualItems" >> _type >> "furniture")) isEqualTo 1) then {
					if (count _containers < (_houseCfg select 1)) then {
						_isPlaced = true;
						if (life_HC_isActive) then {
							[_uid,_container] remoteExec ["HC_fnc_addContainer",HC_Life];
						} else {
							[_uid,_container] remoteExec ["TON_fnc_addContainer",RSERV];
						};
						_container setVariable ["Trunk",[[],0],true];
						_container setVariable ["container_owner",[_uid],true];
						_containers pushBack _container;
						_house setVariable ["containers",_containers,true];
						sleep 1;
					};
				}
				else
				{
					if (count _furnitures < (getNumber(missionConfigFile >> "Housing" >> worldName >> (typeOf _house) >> "furniture"))) then {
						_isPlaced = true;
						if (life_HC_isActive) then {
							[_uid,_container] remoteExec ["HC_fnc_addContainer",HC_Life];
						} else {
							[_uid,_container] remoteExec ["TON_fnc_addContainer",RSERV];
						};
						_container setVariable ["Trunk",[[],0],true];
						_container setVariable ["container_owner",[_uid],true];
						_furnitures pushBack _container;
						_house setVariable ["furnitures",_furnitures,true];
						sleep 1;
					};
				};
            };
        };
    };
};

if (_isPlaced) exitWith {};

deleteVehicle _container;
[true,_type,1] call life_fnc_handleInv;

if (_message isEqualTo 0 || _message isEqualTo 1) then {
    hint localize "STR_House_Container_House_Near";
};
if (_message isEqualTo 2) then {
    hint localize "STR_House_Container_House_Near_Owner";
};
if (_message isEqualTo 3) then {
    hint localize "STR_House_Container_Floating";
};
if (_message isEqualTo 4) then {
    hint localize "STR_ISTR_Box_HouseFull";
};