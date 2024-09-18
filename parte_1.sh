argumentos_esperados=2
padron=112571
directorio_resultado_txt=resultado

if [[ $# -ne $argumentos_esperados ]]; then
    echo "Ingresaste unos argumentos invalidos. (se pide <padron> <directorio>)"
    exit 1
elif ! [[ $padron =~ ^[0-9]+$ ]]; then
    echo "<padron> debe ser un numero entero."
    exit 1
fi

tipo_pokemon=$(expr $padron % 18 + 1)
estadistica_total_pokemon=$(expr $padron % 100 + 350)

directorio_pokemon_csv=$(pwd | find -name pokemon.csv)
directorio_pokemon_types_csv=$(pwd | find -name pokemon_types.csv)
directorio_stats_csv=$(pwd | find -name stats.csv)
directorio_pokemon_stats_csv=$(pwd | find -name pokemon_stats.csv)

lista_pokemon_id=($(cat $directorio_pokemon_types_csv | cut -d "," -f 1,2 | grep ",$tipo_pokemon" | cut -d "," -f 1))
lista_id_stats=($(cat $directorio_stats_csv | cut -d "," -f 1 | grep [1-6]))
lista_definitiva=()

#filtro pokemon
for pokemon_id in ${lista_pokemon_id[@]}; do
    for stat in ${lista_id_stats[@]}; do
        valor_stat=$(cat $directorio_pokemon_stats_csv| cut -d "," -f 1,2,3 | grep  "^$pokemon_id,$stat" | cut -d "," -f 3)
         suma_total_stats=$(($suma_total_stats + $valor_stat))
    done
        if [[ $suma_total_stats -gt $estadistica_total_pokemon ]]; then
            lista_definitiva+=($(cat $directorio_pokemon_csv | cut -d "," -f 1,2 | grep "^$pokemon_id," | cut -d "," -f 2))
            suma_total_stats=0
        else
        suma_total_stats=0
        fi
done

#verificador/creador de directorio para resultado.txt
if [[ -d $directorio_resultado_txt ]]; then
    if [[ -f $directorio_resultado_txt/resultado.txt ]]; then
        echo -e "${lista_definitiva[@]}" | tr " " "\n" >  $directorio_resultado_txt/resultado.txt
    else
        touch $directorio_resultado_txt/resultado.txt
        echo -e "${lista_definitiva[@]}" | tr " " "\n" >  $directorio_resultado_txt/resultado.txt
    fi
else
    mkdir $directorio_resultado_txt
    touch $directorio_resultado_txt/resultado.txt
    echo -e "${lista_definitiva[@]}" | tr " " "\n" >  $directorio_resultado_txt/resultado.txt
fi

