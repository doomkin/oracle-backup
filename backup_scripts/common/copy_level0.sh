mv /mnt/backup2/backup/level0 /mnt/backup2/backup/level0_old
cp -u -R /oracle/backup/level0 /mnt/backup2/backup
rm -f -R  /mnt/backup2/backup/level0_old
