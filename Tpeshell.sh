#!/bin/bash


function pause(){
  echo "Appuyer sur Enter pour coontinuer"
  read
}

function saisirUser(){
   echo "Saisir utilisateur"
   read -r util
}

function afficherInfoUser(){

     if grep "^$util : " /etc/passwd > dev/null; then
        echo "L'utilisateur existe "
    else
        echo "L'utilisateur n'existe pas"
    fi
    pause
}

rep=1

while [ "$rep" -ge 1 ]; do
        clear
echo  "	#           AUTOMATISATION DES TACHES  	         #"
echo  "	#------------------------------------------------#"
        printf " menu:\n\n"
        echo "a. Afficher les informations des utilisateur "
        echo "b. Aquisition, insatllation et lancement de l'environnement XAMPP"
        echo "c. Archivage des éléments du repertoire personnel qui ont été modifiés par l'utlisateur sudoer il y'a deux jour dans le péripherique externe ."
	echo "d. Information sur l'utilisation du disque, de la memoire, du processeur et de la swap"
	echo -e "q. Quitter !!"
        read -r choix

        case "$choix" in
  
               a)
                  who
                   saisirUser
                   id $util
                   pause;;
	       b)
                   saisirUser
                   afficherInfoUser;;
              c)
                   echo "informations relatives a votre machine"
                   vmstat              
                   pause;;
              d)
                wget     https://www.apachefriends.org/xampp-files/7.0.18/xampp-osx-7.0.18-0-installer.dmg;
                sleep 5
               echo "téléchargement terminé"   
               apt-get install xampp 
               sleep 3
               echo "installation terminée"
             pause;;
     
             q)
                echo "aurevoir !!!"
                exit;;
       esac
done
