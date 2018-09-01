#!/bin/bash
listado=$(lsusb | awk '{print $6 }')
name=listado=$(lsusb | awk '{ print $7 }')

listaBlanca=/bin/listaBlanca.txt
listaNegra=/bin/listaNegra.txt

for dispositivos in $listado; do
	cad="$(grep -x $dispositivos $listaBlanca)"
	cad2="$(grep -x $dispositivos $listaNegra)"
	if [ "$dispositivos" == "$cad" ];
	then 
		echo "match"
elif [ "$dispositivos" == "$cad2" ]
	then
		echo -e "USB ($name) detectada en lista negra, no se va a montar"
	else
		
	#statements
		echo "no match"
		echo -e "Ha ingresado la USB $name, es de confianza? ingrese s en caso de afirmativo"
		read usb

		if [[ "$usb" == "s" ]]; then
			echo "$dispositivos" >> /bin/listaBlanca.txt
		else 
			echo "$dispositivos" >> /bin/listaNegra.txt
		fi

	fi
	#touch $listaBlanca >> $dispositivos
done


#volumen log volumen fisico


