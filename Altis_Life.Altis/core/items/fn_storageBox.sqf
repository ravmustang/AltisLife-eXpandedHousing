#include "..\..\script_macros.hpp"
/*
    File : fn_storageBox.sqf
    Author: NiiRoZz

    Description:
    Create Storage and attachto player;
*/
private ["_object","_attachPos","_objectClassName"];
params [
    ["_size","storagesmall",["storagesmall"]]
];
if (!(nearestObject [player, "House"] in life_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse";};

life_container_active = true;
closeDialog 0;

_objectClassName = getText(missionConfigFile >> "CfgDonkeyPunchCustoms" >> _size);
_object = _objectClassName createVehicle [0,0,0];

life_container_activeObj = _object;
_attachPos = [0.16, 3, ((boundingBoxReal _object) select 1) select 2];
[_object] remoteExecCall ["life_fnc_simDisable",RANY];
_object attachTo[player, _attachPos];

[_object] call life_fnc_buildFurniture;

clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearItemCargoGlobal _object;
clearBackpackCargoGlobal _object;

titleText [localize "STR_NOTF_PlaceContainer", "PLAIN"];
