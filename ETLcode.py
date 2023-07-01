#exctract จากfile /etc/passed เป็น csv
echo "Extracting data"

#เดิม7 column ต้องการแค่ (user name), 2 (user id) และ 6 (home directory path)
#ตัดมาใส่ไฟล์ extracted-data.txt
cut -d":" -f1,3,6 /etc/passwd > extracted-data.txt

#tranform : เป็น ,
#tr มาใส่ไฟล์ transformed-data.csvP
echo "Transforming data"
tr ":" "," < extracted-data.txt > transformed-data.csv

#load csv เข้า postgres
echo "Loading data"

#จากที่เราสร้าง table user ไว้แล้วใน postgres ก็ใส่คำสั่ง copy จากไฟล์ transformed-data.csv มีตัวแบ่งcolumnเป็น ,
echo "\c template1;\COPY users  FROM '/home/project/transformed-data.csv' DELIMITERS ',' CSV;" | psql --username=postgres --host=localhostP