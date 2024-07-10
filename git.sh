#!/bin/bash

# Fonction pour obtenir le prochain numéro de commit
get_next_commit_number() {
    # Si le dépôt Git n'existe pas encore, retourner 1
    if [ ! -d .git ]; then
        echo 1
        return
    fi

    # Obtenir le dernier numéro de commit
    last_commit_message=$(git log -1 --pretty=%B)
    if [[ $last_commit_message =~ m([0-9]+) ]]; then
        last_commit_number=${BASH_REMATCH[1]}
        echo $((last_commit_number + 1))
    else
        echo 1
    fi
}

# Obtenir le prochain numéro de commit
next_commit_number=$(get_next_commit_number)

# Initialiser le dépôt Git s'il n'existe pas
if [ ! -d .git ]; then
    git init
fi

# Ajouter tous les fichiers
git add .

# Créer un commit avec le message incrémenté
git commit -m "m$next_commit_number"

# Pousser les changements vers la branche sivani
git push -f origin sivani