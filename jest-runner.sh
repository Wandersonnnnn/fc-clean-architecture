#!/bin/bash

# Converte caminhos do Windows para Unix
args=()
for arg in "$@"; do
    # Se o argumento começa com //wsl.localhost, converte
    if [[ $arg == //wsl.localhost* ]]; then
        # Remove //wsl.localhost/Ubuntu-22.04 e mantém só o caminho Unix
        converted=$(echo "$arg" | sed 's|//wsl.localhost/Ubuntu-22.04||')
        args+=("$converted")
    else
        args+=("$arg")
    fi
done

# Executa o jest com os argumentos convertidos
npx jest "${args[@]}"
