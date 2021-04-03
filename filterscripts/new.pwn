// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_samp>
#include <discord-connector>
#include <discord-cmd>
#include <sscanf2>

#define FILTERSCRIPT
#define CHANNEL_ID "812937034272210986"
#define function%0(%1) forward %0(%1); public %0(%1)

new online;
new uptime = 0;
new DCC_Embed:Status;
new DCC_Embed:Luring;
new DCC_User:role_dev;

public OnFilterScriptInit()
{
	print("-----------------------");
	print("DLOGS BY NRAF v1.1");
	print("-----------------------");
	SetTimer("BotStatus", 1000, true);
	new DCC_Channel:g_Discord_Chat;

    if (_:g_Discord_Chat == 0)
    g_Discord_Chat = DCC_FindChannelById("823474227368689680"); // Discord channel ID
	Status = DCC_CreateEmbed("DEWATA ROLEPLAY","Server Status","","",0x800080,"Join us @dewatarp.xyz","","https://dewatarp.xyz/DEWATA.png","");
	DCC_AddEmbedField(Status, "KOTA DEWATA", "Server is Online!", true);
	DCC_SendChannelEmbedMessage(g_Discord_Chat,Status);
	return 1;
}

public OnFilterScriptExit()
{
    new DCC_Channel:g_Discord_Chat;

    if (_:g_Discord_Chat == 0)
    g_Discord_Chat = DCC_FindChannelById("823474227368689680"); // Discord channel ID
	Luring = DCC_CreateEmbed("DEWATA ROLEPLAY","Server Status","","",0x800080,"Join us @dewatarp.xyz","","https://dewatarp.xyz/DEWATA.png","");
	DCC_AddEmbedField(Luring, "KOTA DEWATA", "Server Offline!", true);
	DCC_SendChannelEmbedMessage(g_Discord_Chat,Luring);
	DCC_DeleteEmbed(Status);
	return 1;
}

main()
{
}

forward BotStatus();
public BotStatus()
{
    new hours = 0, mins = 0, secs = 0;
	hours = floatround(uptime / 3600);
	mins = floatround((uptime / 60) - (hours * 60));
	secs = floatround(uptime - ((hours * 3600) + (mins * 60)));
	uptime++;
	new statuz[256];
	format(statuz,sizeof(statuz),"%d Players | %02dj %02dm Uptime",online,hours,mins);
	DCC_SetBotActivity(statuz);
}

public OnPlayerConnect(playerid)
{
	online++;
	new h, m, s;
	new day, month, year;
	gettime(h, m, s);
	getdate(year,month,day);
    new DCC_Channel:g_Discord_Chat;
	new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);

    if (_:g_Discord_Chat == 0)
    g_Discord_Chat = DCC_FindChannelById(CHANNEL_ID); // Discord channel ID

    new string[128];
    format(string, sizeof string, "Player ID %d",playerid);
    new DCC_Embed:apalah;
 	new str[526],stro[526];
 	format(str,sizeof(str),"%s",name);
 	format(stro,sizeof(stro),"%d/%d",online,GetMaxPlayers());
	apalah = DCC_CreateEmbed("DEWATA ROLEPLAY","Player Connecting","","",0x800080,"Join us @dewatarp.xyz","","http://dewatarp.xyz/DEWATA.png","");
	DCC_AddEmbedField(apalah, str, string, true);
	DCC_AddEmbedField(apalah, "Current Players", stro, true);
	DCC_SendChannelEmbedMessage(g_Discord_Chat,apalah);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	online--;
	new reasontext[526];
	switch(reason)
	{
	    case 0: reasontext = "Timeout/Crash";
	    case 1: reasontext = "Quit";
	    case 2: reasontext = "Kick/Ban";
	}
	new h, m, s;
	new day, month, year;
	gettime(h, m, s);
	getdate(year,month,day);
    new DCC_Channel:g_Discord_Chat;
	new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);

    if (_:g_Discord_Chat == 0)
    g_Discord_Chat = DCC_FindChannelById(CHANNEL_ID); // Discord channel ID

    new string[128];
    format(string, sizeof string, "Player ID %d",playerid);
    new DCC_Embed:apalah;
 	new str[526],stra[526],stro[526];
 	format(str,sizeof(str),"%s",name);
 	format(stra,sizeof(stra),"%s",reasontext);
 	format(stro,sizeof(stro),"%d/%d",online,GetMaxPlayers());
	apalah = DCC_CreateEmbed("DEWATA ROLEPLAY","Player Disconnect","","",0xff0000,"Join us @dewatarp.xyz","","http://dewatarp.xyz/DEWATA.png","");
	DCC_AddEmbedField(apalah, str, string, true);
	DCC_AddEmbedField(apalah, "Reason", stra, true);
	DCC_AddEmbedField(apalah, "Current Player", stro, true);
	DCC_SendChannelEmbedMessage(g_Discord_Chat,apalah);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	new reasontext[526];
	switch(reason)
	{
	    case 49: reasontext = "Rammed by Car";
	    case 50: reasontext = "Helicopter blades";
	    case 51: reasontext = "Explosion";
	    case 53: reasontext = "Drowned";
	    case 54: reasontext = "Splat";
	    case 255: reasontext = "Suicide";
	}
	new h, m, s;
	new day, month, year;
	gettime(h, m, s);
	getdate(year,month,day);
    new DCC_Channel:g_Discord_Chat;
	new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);

    if (_:g_Discord_Chat == 0)
    g_Discord_Chat = DCC_FindChannelById(CHANNEL_ID); // Discord channel ID

    new string[128];
    format(string, sizeof string, "Player ID %d",playerid);
    new DCC_Embed:apalah;
 	new str[526],stra[526];
 	format(str,sizeof(str),"%s",name);
 	format(stra,sizeof(stra),"%s",reasontext);
	apalah = DCC_CreateEmbed("DEWATA ROLEPLAY","Player Death","","",0xff0000,"Join us @dewatarp.xyz","","http://dewatarp.xyz/DEWATA.png","");
	DCC_AddEmbedField(apalah, str, string, true);
	DCC_AddEmbedField(apalah, "Reason", stra, true);
	DCC_SendChannelEmbedMessage(g_Discord_Chat,apalah);
	    
	return 1;
}
public OnPlayerText(playerid, text[])
{
	return 1;
}
DCMD:players(user, channel, params[])
{
	new plonline[526];
	format(plonline,sizeof(plonline),"Current plyaers %d",online);
	DCC_SendChannelMessage(channel,plonline);
}
DCMD:pengumuman(user, channel, params[])
{
    if(_:role_dev == 0)
    {
    	role_dev = DCC_FindUserById("605976123578515467");
    	return 1;
	}
	if(sscanf(params, "s[526]", params[0])) return DCC_SendChannelMessage(channel,"USAGE: /pengumuman [TEXT]");
  	new pesan[526],namadc[33],pesan_a[526];
 	DCC_GetUserName(user, namadc, sizeof(namadc));
 	format(pesan,sizeof(pesan),"%s",params[0]);
 	format(pesan_a,sizeof(pesan_a),"Pengumuman dari %s",namadc);
 	new DCC_Embed:apalah;
	apalah = DCC_CreateEmbed("DEWATA ROLEPLAY","","","",0x800080,"Join us @dewatarp.xyz","","http://dewatarp.xyz/DEWATA.png","");
	DCC_AddEmbedField(apalah, pesan_a, pesan, true);
	DCC_SendChannelEmbedMessage(channel,apalah);
	DCC_SendChannelMessage(channel,"@everyone");
	new DCC_Message:koman;
	koman = DCMD_GetCommandMessageId();
	DCC_DeleteMessage(koman);
	return 1;
}
DCMD:command(user, channel, params[])
{
    new DCC_Embed:apalah;
	apalah = DCC_CreateEmbed("DEWATA ROLEPLAY","","","",0x800080,"Join us @dewatarp.xyz","","http://dewatarp.xyz/DEWATA.png","");
	DCC_AddEmbedField(apalah, "LIST COMMAND", "players, pengumuman,", true);
	DCC_SendChannelEmbedMessage(channel,apalah);
}
DCMD:delete(user, channel, params[])
{
    new DCC_Message:koman;
	koman = DCMD_GetCommandMessageId();
	DCC_DeleteMessage(koman);
}
