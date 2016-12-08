#!/bin/sh

##
# Requisitos: Disponer del paquete curl instalado
# opkg install curl
##

# Directorio del script en la ra�z del disco duro
cd /media/hdd

# URL de los picons y string del que queremos descargar
url=http://picons.eu/downloads
printf "\\n -- Accediendo sobre el dominio picons.eu y averiguando qu� archivos bajar... \\n\\n"
fileToDownload=$(curl $url/?dir=binaries-srp-full | egrep -o srp-full.220x132-220x132.light.on.transparent_[0-9]{4}\-[0-9]{2}\-[0-9]{2}\-\-[0-9]{2}\-[0-9]{2}\-[0-9]{2}.symlink.tar.xz | head -n1)
absoluteUrl=$url/binaries-srp-full/$fileToDownload

# La descarga, extracci�n, ubicaci�n y borrado de basura
printf "\\n -- Ahora, vamos a descargar los picons... \\n\\n"
curl -O $absoluteUrl
printf "\\n\\n -- Extrayendo..."
tar -xvf *.tar.xz > /dev/null
printf " copiando..."
cp -rf srp*/* picon
printf " y borrando los temporales.\\n"
rm -r srp*

# Ahora, procedemos a sobreescribir con los del repo de LUCIFER
#printf "\\nAhora, procederemos a sobreescribir con los del repo de LUCIFER.\\n"
#printf "\\n -- Descargamos...\\n\\n"
#urlGitLucifer=https://github.com/LUCIFERspa/Picon_Movistar/archive/master.zip
#curl -LOk $urlGitLucifer
#printf "\\nextraemos, copiamos y borramos.\\n"
#unzip master.zip > /dev/null
#cp -rf *-master/* picon
#rm -rf *master*
printf "\\n ------- VOILA! -------\\n\\n"
