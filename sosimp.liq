#!/usr/bin/liquidsoap

# logging
set("log.file.path", "/tmp/ls.log")
set("log.stdout", true)

play = playlist("/share/music/jazz/nils_petter_molvaer-solid_ether/solid_ether.m3u");

#radio = fallback(track_sensitive=false,
#		[play, noise(id='noise')])
		#transitions=[crossfade],
#		[direct, live, requests, mpd, all, noise(id="noisesoap") ])
v = liquidsoap.version;
noise = sine();
a = system("ls");
#b = read();
# server.execute # exec a liquidsoap server command
c = request.create("/share/music/jazz/nils_petter_molvaer-solid_ether/solid_ether.m3u");

output.alsa(bufferize=false,noise)
#output.oss(noise);

## svitsj
#@ auto
#@ studio

#@ http.get(next)
# play next(filnavn,crossfade)
# http.get(played)



# ogg output, local radio
#output.icecast.vorbis(
#	host='localhost', port=8000,
#	password='playitforme', mount='soap.ogg',
#	restart=true,name='Radio Vaffel',genre='alt',
#	description='LiquidSoap Radio Vaffel',
#	url='http://localhost:8000',
#	radio)

# ogg output, delta9 radio
#output.icecast.vorbis(
#	host='delta-9.org', port=8000,
#	password='playitforme', mount='simple.ogg',
#	restart=true,name='D9 Radio Vaffel',genre='alt',
#	description='LiquidSoap Radio Vaffel',
#	url='http://delta-9.org:8000',
#	quality=1.0,
#	radio)

# ogg output, linpro radio
#output.icecast.vorbis(
#	host='localhost', port=8800,
#	password='playitforme', mount='rplsoap.ogg',
#	restart=true,name='RPL Radio Vaffel',genre='alt',
#	description='LiquidSoap Radio Vaffel',
#	url='http://members.linpro.no:8000',
#	radio)

#output.icecast.mp3(
#	host='localhost', port=8000,
#	password='playitforme', mount='soap',
#	radio)

#output.icecast.mp3(
#	host='localhost', port=8000,
#	samplerate=22050, stereo=false, bitrate=32
#	password='playitforme', mount='soap-low',
#	radio)


