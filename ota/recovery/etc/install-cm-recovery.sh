#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 15632384 ac9b39bca1d36b383510fdbd6cc12e21e7333f58 11479040 805c54ece89bcd6876828afaf99612b1164c912c
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:15632384:ac9b39bca1d36b383510fdbd6cc12e21e7333f58; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:11479040:805c54ece89bcd6876828afaf99612b1164c912c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery ac9b39bca1d36b383510fdbd6cc12e21e7333f58 15632384 805c54ece89bcd6876828afaf99612b1164c912c:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
