# MySQL
MySQLの学習用

構築手順
1.docker-compose build
2.docker-compose up -d
3.docker exec -it {ID} /bin/bash
4./etc/init.d/mysql start
5.mysql -u {user} -p
6.エラーが出ない+データベースを作成できるのを確認。 

dbBackup.sqlにデータベースとテーブルのバックアップが入ってます。

参考：
https://qiita.com/muff1225/items/48e0753e7b745ec3ecbd
