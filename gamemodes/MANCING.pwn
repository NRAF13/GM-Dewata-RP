/*      FISHING
        1024.7392,-1927.2009,12.7632,186.7729/Cords Jual Ikan

*/
/*------[ VARIABLE ]------*/
new WAKTUMAN[MAX_PLAYERS];
new PICKUPMAN;
new JUALIKAN;
new RandomWaktu;
/*------[ PICKUP ]------*/
CreateSewaKapal()
{
	CreateDynamic3DTextLabel(""c_yellow"SEWA KAPAL",col_white,953.4431,-2091.1276,1.5246,10.0);
	PICKUPMAN = CreateDynamicPickup(19605,1,953.4431,-2091.1276,1.5246);
	CreateDynamic3DTextLabel(""c_yellow"JUAL IKAN",col_white,1024.7392,-1927.2009,12.7632,10.0);
	JUALIKAN = CreateDynamicPickup(19605,1,1024.7392,-1927.2009,12.7632);
	CreateDynamicMapIcon(648.6795,-2491.3317,-0.5058,9,0);
}
/*------[ CMD ]------*/
CMD:mancing(playerid)
{
    if(!p_info [ playerid ] [ pancing ]) return SendClientMessage(playerid,col_white,""scm_error"Kamu tidak punya pancingan");
	if(!IsPlayerInRangeOfPoint(playerid,25.0,648.6795,-2491.3317,-0.5058)) return SendClientMessage(playerid,col_white,""scm_error"Anda tidak berada di laut");
	RandomWaktu = RandomEx(15,70);
	WAKTUMAN[playerid] = SetTimerEx("mancing",1000,true,"i",playerid);
	PlayerTextDrawShow(playerid,WaktuRob);
	return 1;
}
CMD:unrent(playerid)
{
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,col_white,""scm_error"Anda sedang tidak mengendarai apapun");
	if(GetPlayerVehicleID(playerid) != kapal) return SendClientMessage(playerid,col_white,""scm_sucess"Anda sedang tidak menyewa kapal");
	DestroyVehicle(kapal);
	return 1;
}
CMD:cekikan(playerid)
{
	new strfal[526];
	format(strfal,sizeof(strfal),""scm_info"Jumlah ikan yang kamu miliki: %d",p_info [ playerid ] [ ikan ]);
 	SendClientMessage(playerid,col_white,strfal);
 	return 1;
}
/*------[ CALLBACK ]------*/
callback: mancing(playerid)
{
	RandomWaktu--;
	new tdstr[526];
	format(tdstr,sizeof(tdstr),"Waiting ~r~%s",convert_time ( RandomWaktu ));
	PlayerTextDrawSetString(playerid,WaktuRob,tdstr);
	if(RandomWaktu == 0)
	{
	    KillTimer(WAKTUMAN[playerid]);
	    PlayerTextDrawHide(playerid,WaktuRob);
		new Ikan = RandomEx(0,5);
		new berat = RandomEx(1,5);
		if(Ikan == 0)
		{
		    SendClientMessage(playerid,col_white,""scm_error"Anda mendapatkan sampah");
		}
		if(Ikan == 1)
		{
			new stri[536];
			format(stri,sizeof(stri),""scm_sucess"Anda mendapatkan ikan tuna dengan berat %d",berat);
			SendClientMessage(playerid,col_white,stri);
			p_info [ playerid ] [ ikan ] += berat;
			update_int_sql ( playerid, "u_ikan", p_info [ playerid ] [ ikan ]);
		}
		if(Ikan == 2)
		{
		    new stri[536];
			format(stri,sizeof(stri),""scm_sucess"Anda mendapatkan ikan patin dengan berat %d",berat);
			SendClientMessage(playerid,col_white,stri);
			p_info [ playerid ] [ ikan ] += berat;
			update_int_sql ( playerid, "u_ikan", p_info [ playerid ] [ ikan ]);
		}
		if(Ikan == 3)
		{
		    new stri[536];
			format(stri,sizeof(stri),""scm_sucess"Anda mendapatkan ikan hiu dengan berat %d",berat);
			SendClientMessage(playerid,col_white,stri);
			p_info [ playerid ] [ ikan ] += berat;
			update_int_sql ( playerid, "u_ikan", p_info [ playerid ] [ ikan ]);
		}
        if(Ikan == 4)
		{
		    new stri[536];
			format(stri,sizeof(stri),""scm_sucess"Anda mendapatkan ikan penyu dengan berat %d",berat);
			SendClientMessage(playerid,col_white,stri);
			p_info [ playerid ] [ ikan ] += berat;
			update_int_sql ( playerid, "u_ikan", p_info [ playerid ] [ ikan ]);
		}
		if(Ikan == 5)
		{
		    new stri[536];
			format(stri,sizeof(stri),""scm_sucess"Anda mendapatkan ikan tongkol dengan berat %d",berat);
			SendClientMessage(playerid,col_white,stri);
			p_info [ playerid ] [ ikan ] += berat;
			update_int_sql ( playerid, "u_ikan", p_info [ playerid ] [ ikan ]);
		}
	}
}
	
