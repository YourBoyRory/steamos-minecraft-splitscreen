#!/bin/bash
GAP=0
run_player() {
    sed -i "s/^gap=.*/gap=$GAP/"  ~/.local/share/PrismLauncher/instances/Split$1/minecraft/config/splitscreen.properties
    sed -i "s/^mode=.*/mode=$2/"  ~/.local/share/PrismLauncher/instances/Split$1/minecraft/config/splitscreen.properties
    /usr/bin/prismlauncher --launch Split$1 &
}

echo "Test"
if [[ "$1" == "4" ]]; then
    run_player 4 'BOTTOM_RIGHT' &
    run_player 3 'BOTTOM_LEFT' &
    run_player 2 'TOP_RIGHT' &
    run_player 1 'TOP_LEFT'
elif [[ "$1" == "3" ]]; then
    run_player 3 'BOTTOM' &
    run_player 2 'TOP_RIGHT' &
    run_player 1 'TOP_LEFT'
elif [[ "$1" == "2" ]]; then
    run_player 2 'RIGHT' &
    run_player 1 'LEFT'
else
    run_player 1 'FULLSCREEN'
fi
