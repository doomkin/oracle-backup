mv /mnt/backup2/backup/level1 /mnt/backup2/backup/level1_old
cp -u -R /oracle/backup/level1 /mnt/backup2/backup/
rm -f -R  /mnt/backup2/backup/level1_old
