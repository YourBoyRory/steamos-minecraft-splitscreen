#!/bin/bash
steamos-nested-desktop # for steamOS
(WAYLAND_DISPLAY=wayland-0 prismlauncher --launch 'Player1') &
(sleep 5; WAYLAND_DISPLAY=wayland-0 prismlauncher --launch 'Player2') &
