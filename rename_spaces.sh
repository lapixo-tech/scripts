#!/bin/bash

#script para renombrado de directorios
#reemplazamos los espacios por guiones bajos
#reemplazamos '_-_' por un único guón bajo

find . -type d -execdir rename 's/ /_/g' {} +
find . -type d -execdir rename 's/_-_/_/g' {} +

#lo mismo de arriba para archivos en lugar de directorios

find . -type f -execdir rename 's/ /_/g' {} +
find . -type f -execdir rename 's/_-_/_/g' {} +

