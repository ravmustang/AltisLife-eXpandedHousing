/*
	fn_buildFurniture
	
	Made for Anarchy, adapted to eXpoch and into Altis Life by DirtySanchez
	
	http://DonkeyPunch.INFO
	
	The contents of this file are under the following license:
	Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License
	http://creativecommons.org/licenses/by-nc-nd/4.0/
*/
params["_builtObj"];
if(isNil "_builtObj")exitWith{diag_log "[Anarchy BuildThread]_builtObj isNil exiting fn_buildFurniture.sqf"};

keyDownEHId = (findDisplay 46) displayAddEventHandler ["KeyDown", { 
	params ["_dikCodeKey", "_dikCode", "_shift", "_ctrl", "_alt"];
	private _handled = false;
	private _builtObj = life_container_activeObj;
	private _itemClassName = life_container_activeObjClassName;
		
	if!(_builtObj isEqualTo 0)	then {
		switch(_dikCode)do{
		hint str _this;
			case 1: {
				detach _builtObj;
				deleteVehicle _builtObj;
				life_container_activeObj = objNull;
				BuildPosX = 0;BuildPosY = 2;BuildPosZ = 1;BuildVecYaw = 0;BuildVecPitch = 0;BuildVecRoll = 0;
				(findDisplay 46) displayRemoveEventHandler ["KeyDown", keyDownEHId];
				hint format["You have stopped Attaching the %1",_itemClassName];
				_handled = true;				
			};
			case 71: {
				_adjust = 1;
				if(_shift)then{_adjust = 3;};
				if(_ctrl)then{_adjust = 0.5;};
				if(_alt)then{	_adjust = 0.25;};
				BuildVecYaw = BuildVecYaw - _adjust;
				_newDirAndUp = [[ sin BuildVecYaw * cos BuildVecPitch,cos BuildVecYaw * cos BuildVecPitch,sin BuildVecPitch],	[[ sin BuildVecRoll,-sin BuildVecPitch,cos BuildVecRoll * cos BuildVecPitch],-BuildVecYaw] call BIS_fnc_rotateVector2D];
				_builtObj setVectorDirAndUp _newDirAndUp;
				_handled = true;
			};
			case 73: {
				_adjust = 1;
				if(_shift)then{_adjust = 3;};
				if(_ctrl)then{_adjust = 0.5;};
				if(_alt)then{	_adjust = 0.25;};
				BuildVecYaw = BuildVecYaw + _adjust;
				_newDirAndUp = [[ sin BuildVecYaw * cos BuildVecPitch,cos BuildVecYaw * cos BuildVecPitch,sin BuildVecPitch],	[[ sin BuildVecRoll,-sin BuildVecPitch,cos BuildVecRoll * cos BuildVecPitch],-BuildVecYaw] call BIS_fnc_rotateVector2D];
				_builtObj setVectorDirAndUp _newDirAndUp;
				_handled = true;
			};
			case 201: {
				_adjust = 0.75;
				if(_shift)then{_adjust = 1.5;};
				if(_ctrl)then{_adjust = 0.25;};
				if(_alt)then{	_adjust = 0.05;};
				BuildPosZ = BuildPosZ + _adjust;
				_builtObj attachTo [player,[BuildPosX,BuildPosY,BuildPosZ]];
				_newDirAndUp = [[ sin BuildVecYaw * cos BuildVecPitch,cos BuildVecYaw * cos BuildVecPitch,sin BuildVecPitch],	[[ sin BuildVecRoll,-sin BuildVecPitch,cos BuildVecRoll * cos BuildVecPitch],-BuildVecYaw] call BIS_fnc_rotateVector2D];
				_builtObj setVectorDirAndUp _newDirAndUp;
				_handled = true;
			};
			case 209: {
				_adjust = 0.75;
				if(_shift)then{_adjust = 1.5;};
				if(_ctrl)then{_adjust = 0.25;};
				if(_alt)then{	_adjust = 0.05;};
				BuildPosZ = BuildPosZ - _adjust;
				_builtObj attachTo [player,[BuildPosX,BuildPosY,BuildPosZ]];
				_newDirAndUp = [[ sin BuildVecYaw * cos BuildVecPitch,cos BuildVecYaw * cos BuildVecPitch,sin BuildVecPitch],	[[ sin BuildVecRoll,-sin BuildVecPitch,cos BuildVecRoll * cos BuildVecPitch],-BuildVecYaw] call BIS_fnc_rotateVector2D];
				_builtObj setVectorDirAndUp _newDirAndUp;
				_handled = true;
			};
			case 72: {
				_adjust = 0.75;
				if(_shift)then{_adjust = 1;};
				if(_ctrl)then{_adjust = 0.5;};
				if(_alt)then{	_adjust = 0.25;};
				BuildPosY = BuildPosY + _adjust;
				_builtObj attachTo [player,[BuildPosX,BuildPosY,BuildPosZ]];
				_newDirAndUp = [[ sin BuildVecYaw * cos BuildVecPitch,cos BuildVecYaw * cos BuildVecPitch,sin BuildVecPitch],	[[ sin BuildVecRoll,-sin BuildVecPitch,cos BuildVecRoll * cos BuildVecPitch],-BuildVecYaw] call BIS_fnc_rotateVector2D];
				_builtObj setVectorDirAndUp _newDirAndUp;
				_handled = true;
			};
			case 80: {
				_adjust = 0.75;
				if(_shift)then{_adjust = 1;};
				if(_ctrl)then{_adjust = 0.5;};
				if(_alt)then{	_adjust = 0.25;};
				BuildPosY = BuildPosY - _adjust;
				_builtObj attachTo [player,[BuildPosX,BuildPosY,BuildPosZ]];
				_newDirAndUp = [[ sin BuildVecYaw * cos BuildVecPitch,cos BuildVecYaw * cos BuildVecPitch,sin BuildVecPitch],	[[ sin BuildVecRoll,-sin BuildVecPitch,cos BuildVecRoll * cos BuildVecPitch],-BuildVecYaw] call BIS_fnc_rotateVector2D];
				_builtObj setVectorDirAndUp _newDirAndUp;
				_handled = true;
			};
			case 75: {
				_adjust = 0.75;
				if(_shift)then{_adjust = 1;};
				if(_ctrl)then{_adjust = 0.5;};
				if(_alt)then{	_adjust = 0.25;};
				BuildPosX = BuildPosX - _adjust;
				_builtObj attachTo [player,[BuildPosX,BuildPosY,BuildPosZ]];
				_newDirAndUp = [[ sin BuildVecYaw * cos BuildVecPitch,cos BuildVecYaw * cos BuildVecPitch,sin BuildVecPitch],	[[ sin BuildVecRoll,-sin BuildVecPitch,cos BuildVecRoll * cos BuildVecPitch],-BuildVecYaw] call BIS_fnc_rotateVector2D];
				_builtObj setVectorDirAndUp _newDirAndUp;
				_handled = true;
			};
			case 77: {
				_adjust = 0.75;
				if(_shift)then{_adjust = 1;};
				if(_ctrl)then{_adjust = 0.5;};
				if(_alt)then{	_adjust = 0.25;};
				BuildPosX = BuildPosX + _adjust;
				_builtObj attachTo [player,[BuildPosX,BuildPosY,BuildPosZ]];
				_newDirAndUp = [[ sin BuildVecYaw * cos BuildVecPitch,cos BuildVecYaw * cos BuildVecPitch,sin BuildVecPitch],	[[ sin BuildVecRoll,-sin BuildVecPitch,cos BuildVecRoll * cos BuildVecPitch],-BuildVecYaw] call BIS_fnc_rotateVector2D];
				_builtObj setVectorDirAndUp _newDirAndUp;
				_handled = true;
			};
			case 76: {
				_adjust = 0.75;
				if(_shift)then{_adjust = 1;};
				if(_ctrl)then{_adjust = 0.5;};
				if(_alt)then{	_adjust = 0.25;};
				BuildPosX = 0;BuildPosY = 2;BuildPosZ = 1;BuildVecYaw = 0;BuildVecPitch = 0;BuildVecRoll = 0;
				_builtObj attachTo [player,[BuildPosX,BuildPosY,BuildPosZ]];
				_newDirAndUp = [[ sin BuildVecYaw * cos BuildVecPitch,cos BuildVecYaw * cos BuildVecPitch,sin BuildVecPitch],	[[ sin BuildVecRoll,-sin BuildVecPitch,cos BuildVecRoll * cos BuildVecPitch],-BuildVecYaw] call BIS_fnc_rotateVector2D];
				_builtObj setVectorDirAndUp _newDirAndUp;
				_handled = true;
			};
			
			case 208: {
				_adjust = 0.75;
				if(_shift)then{_adjust = 1;};
				if(_ctrl)then{_adjust = 0.5;};
				if(_alt)then{	_adjust = 0.25;};
				BuildVecPitch = BuildVecPitch + _adjust;BuildVecYaw = BuildVecYaw;BuildVecRoll = BuildVecRoll;
				_newDirAndUp = [[ sin BuildVecYaw * cos BuildVecPitch,cos BuildVecYaw * cos BuildVecPitch,sin BuildVecPitch],	[[ sin BuildVecRoll,-sin BuildVecPitch,cos BuildVecRoll * cos BuildVecPitch],-BuildVecYaw] call BIS_fnc_rotateVector2D];
				_builtObj setVectorDirAndUp _newDirAndUp;
				_handled = true;
			};
			case 200: {
				_adjust = 0.75;
				if(_shift)then{_adjust = 1;};
				if(_ctrl)then{_adjust = 0.5;};
				if(_alt)then{	_adjust = 0.25;};
				BuildVecPitch = BuildVecPitch - _adjust;BuildVecYaw = BuildVecYaw;BuildVecRoll = BuildVecRoll;
				_newDirAndUp = [[ sin BuildVecYaw * cos BuildVecPitch,cos BuildVecYaw * cos BuildVecPitch,sin BuildVecPitch],	[[ sin BuildVecRoll,-sin BuildVecPitch,cos BuildVecRoll * cos BuildVecPitch],-BuildVecYaw] call BIS_fnc_rotateVector2D];
				_builtObj setVectorDirAndUp _newDirAndUp;
				_handled = true;
			};
			case 203: {
				_adjust = 0.75;
				if(_shift)then{_adjust = 1;};
				if(_ctrl)then{_adjust = 0.5;};
				if(_alt)then{	_adjust = 0.25;};
				BuildVecRoll = BuildVecRoll - _adjust;
				_newDirAndUp = [[ sin BuildVecYaw * cos BuildVecPitch,cos BuildVecYaw * cos BuildVecPitch,sin BuildVecPitch],	[[ sin BuildVecRoll,-sin BuildVecPitch,cos BuildVecRoll * cos BuildVecPitch],-BuildVecYaw] call BIS_fnc_rotateVector2D];
				_builtObj setVectorDirAndUp _newDirAndUp;
				_handled = true;
			};
			case 205: {
				_adjust = 0.75;
				if(_shift)then{_adjust = 1;};
				if(_ctrl)then{_adjust = 0.5;};
				if(_alt)then{	_adjust = 0.25;};
				BuildVecRoll = BuildVecRoll + _adjust;
				_newDirAndUp = [[ sin BuildVecYaw * cos BuildVecPitch,cos BuildVecYaw * cos BuildVecPitch,sin BuildVecPitch],	[[ sin BuildVecRoll,-sin BuildVecPitch,cos BuildVecRoll * cos BuildVecPitch],-BuildVecYaw] call BIS_fnc_rotateVector2D];
				_builtObj setVectorDirAndUp _newDirAndUp;
				_handled = true;
			};
		};
	};
	_handled;
}];