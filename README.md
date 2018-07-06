# Резервное копирование Oracle

## Загрузка

```bash
git clone https://github.com/doomkin/oracle-backup.git
```

## Настройка

1. Актуализируйте **переменные окружения** Oracle в файле [backup_scripts/common/**oraenv**](backup_scripts/common/oraenv).
2. Актуализируйте путь **резервной копии** в файлах [backup_scripts/level0/**lev0.rcv**](backup_scripts/level0/lev0.rcv), [backup_scripts/level1/**lev1.rcv**](backup_scripts/level1/lev1.rcv).
3. Актуализируйте путь этих **сценариев** резервного копирования и переменную окружения **export ORACLE_SID** (для Windows вместо **export** должно быть **set**) [backup_scripts/level0/**lev0_scr.rcv**](backup_scripts/level0/lev0_scr.rcv), [backup_scripts/level0/**lev0_run.sh**](backup_scripts/level0/lev0_run.sh), [backup_scripts/level1/**lev1_scr.rcv**](backup_scripts/level1/lev1_scr.rcv), [backup_scripts/level1/**lev1_run.sh**](backup_scripts/level1/lev1_run.sh).
4. Актуализируйте путь **дополнительной резервной копии** на сетевом диске [backup_scripts/common/**copy_level0.sh**](backup_scripts/common/copy_level0.sh), [backup_scripts/common/**copy_level1.sh**](backup_scripts/common/copy_level1.sh).
5. Актуализируйте срок, за который можно восстановить базу данных из резервной копии в файле [backup_scripts/common/**r_policy.rcv**](backup_scripts/common/r_policy.rcv). По умолчанию установлено **две недели**.

## Установка

1. Актуализируйте файл **расписания** резервного копировани [backup_scripts/cron/**backup_cron**](backup_scripts/cron/backup_cron).

> _Выполнять полный бэкап **level0** каждую неделю в полночь с пятницы на субботу, в нолночь с субботы на воскресенье копировать полный бэкап с локального диска на сетевой с удалением устаревших копий после копирования. Выполнять инкрементальный бэкап **level1** в полночь с понедельника на вторник, со вторника на среду, со среды на четверг, с четверга на пятницу с последующим копированием инкрементального бэкапа в 4 утра с локального диска на сетевой с удалением устаревших копий после копирования._

```
0 0 * * 6   /home/oracle/backup_scripts/level0/lev0_run.sh
0 0 * * 2-5 /home/oracle/backup_scripts/level1/lev1_run.sh
0 0 * * 7   /home/oracle/backup_scripts/common/copy_level0.sh
0 4 * * 2-5 /home/oracle/backup_scripts/common/copy_level1.sh
```

> _Синтаксис [**crontab**](https://losst.ru/nastrojka-cron)._

2. Зарегистрируйте расписание резервного копирования
```bash
./backup_scripts/cron/init_crontab.sh
```
