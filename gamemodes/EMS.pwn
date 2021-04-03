/*
	EMS
*/
//------[ VARIABLE ]------
new TimeAfterDeath[MAX_PLAYERS];
new WaktuMati = 1200;
//------[ FUNCTION ]------
GetDeathPos(playerid)
{
    GetPlayerPos(playerid, PosX[playerid], PosY[playerid], PosZ[playerid]);
    GetPlayerFacingAngle(playerid, PosA[playerid]);
}
SpawnDeath(playerid)
{
	SetPlayerPos(playerid, PosX[playerid], PosY[playerid], PosZ[playerid]);
	SetPlayerFacingAngle(playerid, PosA[playerid]);
	SetPlayerInterior(playerid,GetPlayerInterior(playerid));
	SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(playerid));
}
//------[ CALLBACK ]------
callback: Mokad(playerid)
{
	WaktuMati--;
 	new f_a[256];
 	format(f_a,sizeof(f_a),"Kamu akan kehabisan darah dalam waktu ~b~%s", convert_time ( WaktuMati ));
 	PlayerTextDrawSetString(playerid, TimeDeath, f_a);
 	if(WaktuMati == 0)
 	{
		KillTimer(TimeAfterDeath[playerid]);
		ClearAnimations(playerid);
		give_money ( playerid, - 50000 ) ;
		DeletePVar ( playerid, "p_h_bed" ) ;
		DeletePVar ( playerid, "p_dead" ) ;
		WaktuMati = 1200;
		new random_h_pos = random ( 2 ) ;
		set_pos ( playerid, hospital_spawn [ random_h_pos ] [ 0 ],
							hospital_spawn [ random_h_pos ] [ 1 ],
							hospital_spawn [ random_h_pos ] [ 2 ],
							hospital_spawn [ random_h_pos ] [ 3 ],
							0, p_info [ playerid ] [ hospital ] ) ;
		SendClientMessage(playerid,col_white,""scm_info"Anda telah kehabisan darah, dan telah dibawa ke UGD dengan biaya "c_green"ID$50.000");
	}
}
//------[ CMD ]------
CMD:revive(playerid, params[])
{
	if(sscanf(params, "d", params[0])) return SendClientMessage(playerid,col_white,""scm_info"/revive [playerid]");
	new target = params[0];
	set_health ( playerid, 100.0 ) ;
	KillTimer(TimeAfterDeath[target]);
	ClearAnimations(target);
	PlayerTextDrawHide(target, TimeDeath);
	TogglePlayerControllable(target,1);
	WaktuMati = 1200;
	DeletePVar ( playerid, "p_h_bed" ) ;
	DeletePVar ( playerid, "p_dead" ) ;
	return 1;
}
