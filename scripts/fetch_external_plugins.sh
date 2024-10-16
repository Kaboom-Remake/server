#!/bin/sh
# Script used to fetch latest versions of external plugins
# Plugins: EssentialsX, FastAsyncWorldEdit, GeyserMC, ViaVersion, ViaBackwards, ViaRewind

mkdir -p fetched_plugins

# Fetch plugins
for download_url in https://ci.ender.zone/job/EssentialsX/lastSuccessfulBuild/artifact/*zip*/archive.zip \
                    https://ci.athion.net/job/FastAsyncWorldEdit/lastSuccessfulBuild/artifact/*zip*/archive.zip \
                    https://nightly.link/GeyserMC/Geyser/workflows/build/master/Geyser%20Spigot.zip \
                    https://ci.viaversion.com/job/ViaVersion/lastSuccessfulBuild/artifact/*zip*/archive.zip \
                    https://ci.viaversion.com/job/ViaBackwards/lastSuccessfulBuild/artifact/*zip*/archive.zip \
                    https://ci.viaversion.com/job/ViaRewind/lastSuccessfulBuild/artifact/*zip*/archive.zip
do
    curl -L $download_url > archive.zip
    unzip -o archive.zip
    rm archive.zip
done

# Move plugins
mv archive/jars/EssentialsX-*.jar fetched_plugins/Essentials.jar
mv archive/artifacts/FastAsyncWorldEdit-Bukkit-*.jar fetched_plugins/FastAsyncWorldEdit.jar
mv Geyser-Spigot.jar fetched_plugins/Geyser.jar
mv archive/build/libs/ViaVersion-*.jar fetched_plugins/ViaVersion.jar
mv archive/build/libs/ViaBackwards-*.jar fetched_plugins/ViaBackwards.jar
mv archive/universal/build/libs/ViaRewind-*.jar fetched_plugins/ViaRewind.jar

# Clean up
rm -rf archive/
