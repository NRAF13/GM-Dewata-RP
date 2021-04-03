/*

	TEXTDRAW PING INDICATOR
	
*/

UpdatePing(playerid)
{
	if(GetPlayerPing(playerid) >= 100)
	{
	    TextDrawSetString(td_logo[1],"~r~DEWATARP");
	}
	else if(GetPlayerPing(playerid) >= 60)
	{
	    TextDrawSetString(td_logo[1],"~y~DEWATARP");
	}
	else
	{
	    TextDrawSetString(td_logo[1],"~w~DEWATARP");
	}
}
