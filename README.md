# Project1easyETL
 ทำ ETL แบบง่ายๆใช้แค่ bash script ดึงข้อมูลในzip file แล้วเอาใส่database Postgres
 
ไฟล์ https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz

1.โหลดfileเข้ามา โดยคำสั่ง wget

2.แตกไฟล์ gunzip -f web-server-access-log.txt.gz จะได้ไฟล์ web-server-access-log.txt

3.เชื่อมต่อกับ postgres โดยคำสั่ง psql -U postgres แล้วใส่รหัสของคุณ

4.สร้าง database ชื่อว่า etleasy โดยคำสั่ง create database etleasy;

![3 connectToPostgres](https://github.com/manew-c/Project1easyETL/assets/113186479/28322264-a29b-4887-b7bf-a3c1fff0f0ed)

5.connect กับ etleasy โดยคำสั่ง  \c etleasy

6.สร้าง table เก็บข้อมูล
โดยคำสั่ง  create table access_log( timestamp TIMESTAMP, latitude float, longitude float, visitor_id char);

![10createTable](https://github.com/manew-c/Project1easyETL/assets/113186479/fcaa722b-ff1b-46c3-87fb-dc282c4065fb)

7.ออกจากpostgres

8.สร้างไฟล์ bash ชื่อ cp-access-log.sh

9.เขียนscripct extract เราต้องการแค่ 4 column แรก แล้วเซฟลง extracted-data.txt
  พิมพ์คำสั่ง bash cp-access-log.shเพื่อทดสอบว่ามีไฟล์ extracted-data.txt เกิดขึ้นถูกต้องไหม
  
![4 extract](https://github.com/manew-c/Project1easyETL/assets/113186479/65e86ca4-ced6-4c56-9e16-218151b8d867)

10.เขียนscripct transform แปลง # เป็น , เพื่อเป็นcsv file มาใส่ไฟล์ transformed-data.csv
   พิมพ์คำสั่ง bash cp-access-log.shเพื่อทดสอบว่ามีไฟล์ transformed-data.csv เกิดขึ้นถูกต้องไหม
   
   ![5 tranform](https://github.com/manew-c/Project1easyETL/assets/113186479/1b87638a-8f2f-4ed0-be26-a3509eeae4d3)

11.เชื่อมต่อกับPostgres เพื่อดึงข้อมูลเข้าtableที่สร้างไว้

12. ใช้คำสั่ง \c etleasy;\COPY access_log  FROM 'transformed-data.csv' DELIMITERS ',' CSV HEADER;
    
    
![11 output](https://github.com/manew-c/Project1easyETL/assets/113186479/65fa51e3-2bc1-442f-9c30-88c0cd304231)
