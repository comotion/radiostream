#!/usr/bin/liquidsoap

# logging
set("log.file.path", "out.log")
set("log.stdout", true)

# server interface (should be firewalled)
set("server.telnet", true)

# input.alsa() gives us soundout
#fallback([playlist("http://my/playlist"),
#          single("/my/jingle.ogg")])
#switch([ ({0h-7h}, night), ({7h-24h}, day) ])
#timed_promotions = delay(1200.,promotions)
#main_source = fallback([timed_promotions,other_source])
#lastfm_stream = input.lastfm("lastfm://artist/Wackies")


#set("frame.size",940)
input = input.alsa(bufferize=false)
#output.alsa(bufferize=false,input)


# Play live stream, requests or mpd

# icecast server input
set("harbor.bind_addr", "127.0.0.1")
set("harbor.port", 8008)
set("harbor.password", "playitforme")
direct = input.harbor("live")

live = strip_blank(input.http("http://localhost:8000/live.ogg"))
requests = request.queue(id="request")
mpd = input.http("http://localhost:8000/mpd.ogg")
#all = playlist("/mnt/nypult/audio/and_now_everything.m3u");

radio = fallback(track_sensitive=false,
		#transitions=[crossfade],
		[direct, live, requests, mpd, noise(id="noisesoap") ])



# ogg output, local radio
#output.icecast.vorbis(
#	host='localhost', port=8000,
#	password='playitforme', mount='soap.ogg',
#	restart=true,name='Radio Vaffel',genre='alt',
#	description='LiquidSoap Radio Vaffel',
#	url='http://localhost:8000',
#	radio)

# ogg output, delta9 radio
output.icecast.vorbis(
	host='delta-9.org', port=8000,
	password='playitforme', mount='d9soap.ogg',
	restart=true,name='D9 Radio Vaffel',genre='alt',
	description='LiquidSoap Radio Vaffel',
	url='http://delta-9.org:8000',
	radio)

# ogg output, linpro radio
# output.icecast.vorbis(
# 	host='localhost', port=8800,
# 	password='playitforme', mount='rplsoap.ogg',
# 	restart=true,name='RPL Radio Vaffel',genre='alt',
# 	description='LiquidSoap Radio Vaffel',
# 	url='http://members.linpro.no:8000',
# 	quality=1.0,
# 	radio)

#output.icecast.mp3(
#	host='localhost', port=8000,
#	password='playitforme', mount='soap',
#	radio)

#output.icecast.mp3(
#	host='localhost', port=8000,
#	samplerate=22050, stereo=false, bitrate=32
#	password='playitforme', mount='soap-low',
#	radio)


