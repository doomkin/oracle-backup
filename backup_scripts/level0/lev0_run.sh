LEVEL=0
export ORACLE_SID=PARUS
BACKUP_SCRIPTS=/home/oracle/backup_scripts
DATE=`date +"%Y-%m-%d_%H-%M"`

. $BACKUP_SCRIPTS/common/oraenv
rman target / cmdfile "$BACKUP_SCRIPTS"/level"$LEVEL"/lev"$LEVEL"_scr.rcv log "$BACKUP_SCRIPTS"/log/level"$LEVEL"/lev"$LEVEL"_"$DATE".log
