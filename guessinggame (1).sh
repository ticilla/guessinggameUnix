#!/bin/bash
count_files() {
    local count=0
    for item in *; do
        if [ -f "$item" ]; then
            count=$((count + 1))
        fi
    done
    echo "$count"
}

nb_files=$(count_files)
guess=-1

echo "Bienvenue dans le jeu de devinettes !"
echo "Combien de fichiers se trouvent dans le répertoire actuel ?"

while [ "$guess" -ne "$nb_files" ]
do
    read -p "Entrez votre estimation : " response

    # Vérifier que la saisie est bien un nombre entier positif
    if ! [[ "$response" =~ ^[0-9]+$ ]]
    then
        echo "Veuillez entrer un nombre entier valide."
        continue
    fi

    guess=$response

    if [ "$guess" -lt "$nb_files" ]
    then
        echo "Trop bas ! Essayez encore."
    elif [ "$guess" -gt "$nb_files" ]
    then
        echo "Trop haut ! Essayez encore."
    else
        echo "Félicitations ! Vous avez trouvé : il y a $nb_files fichiers."
    fi
done
