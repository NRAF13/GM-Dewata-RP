/* LAST SPAWN */
//------[ VARIABLE ]------
new Float:PosX[MAX_PLAYERS],
    Float:PosY[MAX_PLAYERS],
    Float:PosZ[MAX_PLAYERS],
    Float:PosA[MAX_PLAYERS],
    PosI[MAX_PLAYERS],
    PosVW[MAX_PLAYERS];
//------[ FUNCTION ]------
GetPemainPos(playerid)
{
	GetPlayerPos(playerid,PosX[playerid],PosY[playerid],PosZ[playerid]);
	GetPlayerFacingAngle(playerid,PosA[playerid]);
	PosI[playerid] = GetPlayerInterior(playerid);
	PosVW[playerid] = GetPlayerVirtualWorld(playerid);
	
	new query_string[130];
	p_info [ playerid ] [ posx ] = PosX[playerid];
	format(query_string, sizeof(query_string), "UPDATE `users` SET `u_posx`='%f' WHERE `u_id`='%d' LIMIT 1", p_info [ playerid ] [ posx ], p_info[playerid][id]);
	mysql_query(sql_connection, query_string);
	p_info [ playerid ] [ posy ] = PosY[playerid];
	format(query_string, sizeof(query_string), "UPDATE `users` SET `u_posy`='%f' WHERE `u_id`='%d' LIMIT 1", p_info [ playerid ] [ posy ], p_info[playerid][id]);
	mysql_query(sql_connection, query_string);
	p_info [ playerid ] [ posz ] = PosZ[playerid];
	format(query_string, sizeof(query_string), "UPDATE `users` SET `u_posz`='%f' WHERE `u_id`='%d' LIMIT 1", p_info [ playerid ] [ posz ], p_info[playerid][id]);
	mysql_query(sql_connection, query_string);
	p_info [ playerid ] [ posa ] = PosA[playerid];
	format(query_string, sizeof(query_string), "UPDATE `users` SET `u_posa`='%f' WHERE `u_id`='%d' LIMIT 1", p_info [ playerid ] [ posa ], p_info[playerid][id]);
	mysql_query(sql_connection, query_string);
	p_info [ playerid ] [ inter ] = PosI[playerid];
	update_int_sql ( playerid, "u_inter", p_info [ playerid ] [ inter ] ) ;
	p_info [ playerid ] [ vw ] = PosVW[playerid];
	update_int_sql ( playerid, "u_vw", p_info [ playerid ] [ vw ] ) ;
	
}

    

