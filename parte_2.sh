#1: Japonés, 3: Coreano, 4: Chino tradicional, 5: Francés, 6: Alemán, 7: Español, 8: Italiano, 9: Inglés, 11: Japonés, 12: Chino simplificado (恶臭)
idioma=7

directorio_pokemon_csv=$(pwd | find -name pokemon.csv)
directorio_pokemon_abilities_csv=$(pwd | find -name pokemon_abilities.csv)
directorio_ability_names_csv=$(pwd | find -name ability_names.csv)

while read pokemon; do
    #0: (id), 1: (identifier), 2: (altura[metros]), 3: (peso[gramos])
    lista_informacion_pokemon=($(cat $directorio_pokemon_csv | cut -d "," -f 1,2,4,5 | grep ",$pokemon," | tr "," " "))

    if [[ $lista_informacion_pokemon = "" ]]; then
        echo -e "$pokemon no existe o ingresaste vacio ( ∅ ).\n"
    elif [[ $pokemon =~ ^[0-9]+$ ]]; then
        echo -e "Ingresaste un numero entero no un <pokemon>.\n"
    else
        ability_id=($(cat $directorio_pokemon_abilities_csv | cut -d "," -f 1,2 | grep ""^${lista_informacion_pokemon[0]}"," | cut -d "," -f 2)) 
        altura=$(( ${lista_informacion_pokemon[2]} * 10 ))
        peso=$(( ${lista_informacion_pokemon[3]} / 10 ))

        #imprimir datos del pokemon
        echo "------------------"
        echo "Pokemon: $pokemon"
        echo "Altura: $altura centimetros"
        echo "Peso: $peso kilos"
        echo -e "\n Habilidades:"
        for habilidad in ${ability_id[@]}; do
            nombre_habilidad=($(cat $directorio_ability_names_csv | cut -d "," -f 1,2,3 | grep ""^$habilidad","$idioma"" | cut -d "," -f 3))
            echo " * ${nombre_habilidad[@]}"
        done
        echo -e "------------------\n"
    fi
done