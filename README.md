# PokeScript

Este proyecto implementa dos scripts de Bash que trabajan con información sobre Pokémon para filtrar y mostrar detalles basados en archivos CSV proporcionados.

## Índice

- [Introducción](#introducción)
- [Objetivo del Proyecto](#objetivo-del-proyecto)
- [Requisitos del Sistema](#requisitos-del-sistema)
- [Instalación y Uso](#instalación-y-uso)
- [Scripts Desarrollados](#scripts-desarrollados)
  - [Parte 1: Filtrado de Pokémon](#parte-1-filtrado-de-pokémon)
  - [Parte 2: Información de Pokémon](#parte-2-información-de-pokémon)
  - [Parte 3: Integración](#parte-3-integración)
- [Estructura del Repositorio](#estructura-del-repositorio)
- [Compilación y Ejecución](#compilación-y-ejecución)
- [Autores](#autores)

## Introducción

PokeScript es un conjunto de herramientas diseñadas para procesar datos de Pokémon. Los scripts permiten filtrar Pokémon según ciertos criterios y mostrar información detallada sobre ellos. El proyecto también introduce buenas prácticas de control de versiones utilizando Git y GitHub.

## Objetivo del Proyecto

1. Filtrar Pokémon según tipo y estadísticas.
2. Mostrar información específica de un Pokémon.
3. Consolidar los resultados en un archivo de salida.
4. Aplicar control de versiones con Git.

## Requisitos del Sistema

- Sistema operativo: Linux (probado en distribuciones modernas como Ubuntu).
- Bash (v4.0 o superior).
- Herramientas de terminal: `awk`, `grep` y `expr`.
- Repositorio de Git configurado.
- Archivos CSV disponibles en el repositorio [veekun/pokedex](https://github.com/veekun/pokedex).

## Instalación y Uso

1. Clona el repositorio:

   ```bash
   git clone <URL_DEL_REPOSITORIO>
   cd <CARPETA_DEL_REPOSITORIO>
   ```

2. Cambia a la rama correspondiente para trabajar en una parte específica:

   ```bash
   git checkout parte_1
   ```

3. Descarga y coloca los archivos CSV necesarios desde [veekun/pokedex](https://github.com/veekun/pokedex) en el mismo directorio o subdirectorios.

## Scripts Desarrollados

### Parte 1: Filtrado de Pokémon

El script `parte_1.sh` filtra Pokémon según los siguientes criterios:

- Tipo de Pokémon basado en el padrón del usuario (`padrón % 18 + 1`).
- Estadística total mínima (`padrón % 100 + 350`).

#### Uso

```bash
./parte_1.sh <PADRON> <DIRECTORIO>
```

Ejemplo:

```bash
./parte_1.sh 123456 resultados
```

Salida esperada:

- Archivo `resultado.txt` en el directorio especificado con los nombres de Pokémon que cumplen ambos criterios.

### Parte 2: Información de Pokémon

El script `parte_2.sh` muestra información detallada de Pokémon ingresados por `stdin`.

#### Información Desplegada

- Nombre.
- Altura.
- Peso.
- Lista de habilidades.

#### Uso

```bash
./parte_2.sh
```

Ejemplo:

```bash
echo "pikachu" | ./parte_2.sh
```

Salida esperada:

```plaintext
---------------------
Pokemon: pikachu
Altura: 40 centimetros
Peso: 6 kilos

Habilidades:
 * Electricidad Estática
 * Pararrayos
---------------------
```

### Parte 3: Integración

Combina los resultados de los scripts anteriores:

1. Ejecuta `parte_1.sh` para generar `resultado.txt`.
2. Usa `parte_2.sh` para procesar los Pokémon de `resultado.txt` y genera `output.txt`.

#### Uso

```bash
./parte_1.sh <PADRON> resultados
cat resultados/resultado.txt | ./parte_2.sh > output.txt
```

## Estructura del Repositorio

- **parte\_1.sh:** Script para filtrar Pokémon.
- **parte\_2.sh:** Script para mostrar información de Pokémon.
- **output.txt:** Archivo generado en la parte 3 con los resultados finales.
- **README.md:** Documentación del proyecto.

## Compilación y Ejecución

Este proyecto no requiere compilación. Los scripts se ejecutan directamente en Bash.

Asegúrate de dar permisos de ejecución a los scripts:

```bash
chmod +x parte_1.sh parte_2.sh
```

## Autores

- Diego Jose Fernández Giraldo\
  Alumno de la materia Introducción del desarrollo de software, 2024.

