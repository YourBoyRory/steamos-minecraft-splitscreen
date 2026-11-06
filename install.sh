
clone_base_profile() {
    base_profile="$HOME/.local/share/PrismLauncher/instances/Split1"
    ln -s $base_profile/minecraft/mods $1/minecraft/
    ln -s $base_profile/minecraft/resourcepacks $1/minecraft/
    ln -s $base_profile/minecraft/saves $1/minecraft/
    ln -s $base_profile/minecraft/server-resource-packs $1/minecraft/
    ln -s $base_profile/minecraft/shaderpacks $1/minecraft/
    ln -s $base_profile/minecraft/texturepacks $1/minecraft/
    mkdir $1/minecraft/config
    excluded_files=("splitscreen.properties" "midnightlib.json" "midnightcontrols.json")
    for file in $base_profile/minecraft/config/*; do
        if [[ " ${excluded_files[*]} " != *" $(basename "$file") "* ]]; then
            ln -s "$file" $1/minecraft/config/
        fi
    done
}
# Install Profiles
cp -r ./profiles/* ~/.local/share/PrismLauncher/instances
clone_base_profile ~/.local/share/PrismLauncher/instances/Split2
clone_base_profile ~/.local/share/PrismLauncher/instances/Split3
clone_base_profile ~/.local/share/PrismLauncher/instances/Split4
jq --argjson new '{
    "Split Screen": {
        "hidden": true,
        "instances": ["Split3", "Split4", "Split1", "Split2"]
    }
}' '.groups = ($new * .groups)' $HOME/.local/share/PrismLauncher/instances/instgroups.json > existing.tmp &&
mv existing.tmp $HOME/.local/share/PrismLauncher/instances/instgroups.json
