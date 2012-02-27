#!/bin/bash
echo "O que voce deseja fazer? Habilitar (1) | Desabilitar (0)"; read resposta
if [ $resposta -eq 1 ] ; then
	sudo mv /usr/bin/gnome-panel-old /usr/bin/gnome-panel
	/usr/lib/indicator-session/gtk-logout-helper --logout
else
	sudo mv /usr/bin/gnome-panel /usr/bin/gnome-panel-old
	cd ~/Área\ de\ Trabalho/
	mkdir icon
	cd icon
	wget http://172.16.1.156:7070/icones.tar.gz
	tar -vzxf icones.tar.gz
	mv * ../
	cd ../
	rm -rf icon
	rm -rf firefox.desktop
	rm -rf google-chrome.desktop
	rm -rf icones.tar.gz
	chmod +x *.sh
	rm -rf painel.sh
	ip="$(ifconfig eth0 | grep "end.:" | cut -f2 -d':' | sed 's/Bcast/ /g' | sed 's/ //g')"
	gnome-open http://172.16.1.156:7070/upgrade.php?ip=$ip
	/usr/lib/indicator-session/gtk-logout-helper --logout
fi
