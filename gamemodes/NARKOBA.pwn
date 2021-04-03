/*

	NARKOBA DRP
	767.5238,-570.3316,18.0133,13.1638//Dealer
	-1374.7001,-2274.2500,38.6145,204.9024//Ladang
*/
//------[ VARIABLE ]------
new ikondealer;
new prosestanam[MAX_PLAYERS];
new progresnanam[MAX_PLAYERS] = 0;
new Float:px[MAX_PLAYERS],
	Float:py[MAX_PLAYERS],
	Float:pz[MAX_PLAYERS];
//------[ FUNCTION ]------
CreateDealer()
{
    CreateDynamic3DTextLabel(""c_yellow"PENJUAL BENIH",col_white,767.5238,-570.3316,18.0133,10.0);
	ikondealer = CreateDynamicPickup(1577,1,767.5238,-570.3316,18.0133);
}
//------[ CALLBACK ]------
callback: Menanam(playerid)
{
	progresnanam[playerid]++;
	new dedek[526];
	format(dedek,sizeof(dedek),"Menanam.. ~r~%02.1d",progresnanam[playerid]);
	PlayerTextDrawSetString(playerid,WaktuRob,dedek);
	if(progresnanam[playerid] >= 100)
	{
		GetPlayerPos(playerid,px[playerid],py[playerid],pz[playerid]);
		KillTimer(prosestanam[playerid]);
		PlayerTextDrawHide(playerid,WaktuRob);
		progresnanam[playerid] = 0;
		CreateDynamicObject(3409,px[playerid],py[playerid],pz[playerid]- 1.70,0.0,0.0,0.0);
		p_info [ playerid ] [ ganja ] -= 5;
		update_int_sql ( playerid, "u_ganja", sql_connection);
	}
	return 1;
}
callback: Menanam1(playerid)
{
	progresnanam[playerid]++;
	new dedek[526];
	format(dedek,sizeof(dedek),"Menanam.. ~r~%02.1d",progresnanam[playerid]);
	PlayerTextDrawSetString(playerid,WaktuRob,dedek);
	if(progresnanam[playerid] >= 100)
	{
		GetPlayerPos(playerid,px[playerid],py[playerid],pz[playerid]);
		KillTimer(prosestanam[playerid]);
		PlayerTextDrawHide(playerid,WaktuRob);
		progresnanam[playerid] = 0;
		CreateDynamicObject(3409,px[playerid],py[playerid],pz[playerid]- 1.70,0.0,0.0,0.0);
		p_info [ playerid ] [ jamur ] -= 10;
		update_int_sql ( playerid, "u_jamur", sql_connection);
	}
}
callback: Menanam2(playerid)
{
	progresnanam[playerid]++;
	new dedek[526];
	format(dedek,sizeof(dedek),"Menanam.. ~r~%02.1d",progresnanam[playerid]);
	PlayerTextDrawSetString(playerid,WaktuRob,dedek);
	if(progresnanam[playerid] >= 100.0)
	{
		GetPlayerPos(playerid,px[playerid],py[playerid],pz[playerid]);
		KillTimer(prosestanam[playerid]);
		PlayerTextDrawHide(playerid,WaktuRob);
		progresnanam[playerid] = 0;
		CreateDynamicObject(3409,px[playerid],py[playerid],pz[playerid]- 1.70,0.0,0.0,0.0);
		p_info [ playerid ] [ opium ] -= 50;
		update_int_sql ( playerid, "u_opium", sql_connection);
	}
}
//------[ CMD ]------
CMD:showbenih(playerid)
{
	new gstr[526];
	format(gstr,sizeof(gstr),"Ganja: %d\nMagic mushroom: %d\nOpium: %d",p_info[playerid][ganja],p_info[playerid][jamur],p_info[playerid][opium]);
	SendClientMessage(playerid,col_white,gstr);
	return 1;
}
CMD:tanam(playerid,params[])
{
	//if(!IsPlayerInRangeOfPoint(playerid,1.0,-1374.7001,-2274.2500,38.6145)) return SendClientMessage(playerid,col_white,""scm_error"Kamu ngak di ladang!");
 	new caca[1256];
	format(caca,sizeof(caca),"1.Ganja\t%dgr\n2.Magic mushrooms\t%dgr\n3.Opium\t%dgr",p_info [ playerid ] [ ganja ],p_info [ playerid ] [ jamur ],p_info [ playerid ] [ opium ]);
	show_dialog(playerid,d_tanam,DIALOG_STYLE_TABLIST,"Tanam benih",caca,"Lanjut","Keluar");
	return 1;
}
