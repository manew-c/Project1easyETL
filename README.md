﻿# Project1easyETL
Bash script 
ทำ ETL แบบง่ายๆ ดึงข้อมูลในzip file แล้วเอาใส่database Postgres
ไฟล์ https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz
1.โหลดfileเข้ามา โดยคำสั่ง wget
2.แตกไฟล์ gunzip -f web-server-access-log.txt.gz
3.เชื่อมต่อ postgres
4.สร้าง database ชื่อว่า etleasy
![3 connectToPostgres](https://github.com/manew-c/Project1easyETL/assets/113186479/28322264-a29b-4887-b7bf-a3c1fff0f0ed)
5.connect กับ etleasy
6.สร้าง table เก็บข้อมูล timestamp TIMESTAMP, latitude float, longitude float, visitor_id char
![10createTable](https://github.com/manew-c/Project1easyETL/assets/113186479/fcaa722b-ff1b-46c3-87fb-dc282c4065fb)

7.ออกจากpostgres
8.สร้างไฟล์ bash ชื่อ cp-access-log.sh
9.เขียนscripct extract เราต้องการแค่ 4 column แรก แล้วเซฟลงextracted-data.txt
10.เขียน transform แปลง # เป็น , เพื่อเป็นcsv file มาใส่ไฟล์ transformed-data.csv
11.
