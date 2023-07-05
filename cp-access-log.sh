# Extract 
echo "Extracting data"
# Extract  columns 1 (timestamp), 2 (latitude), 3 (longitude) and 4 (visitorid)
#แล้วเซฟลงextracted-data.txt
cut -d"#" -f1-4 web-server-access-log.txt > extracted-data.txt

# Transform 
echo "Transforming data"
#แปลง # เป็น , เพื่อเป็นcsv file มาใส่ไฟล์ transformed-data.csv
tr "#" "," < extracted-data.txt > transformed-data.csv

# Load 
echo "Loading data"
#ส่งเข้า database etleasy
# copy file ลง table 'access_log' 
echo "\c etleasy;\COPY access_log  FROM 'Project1easyETL\transformed-data.csv' DELIMITERS ',' CSV HEADER;" 


#| psql -U postgres -h localhost ติดerror psql: error: connection to server at "localhost" (127.0.0.1), port 5432 failed: FATAL:  password authentication failed for user "postgres"
#connection to server at "localhost" (127.0.0.1), port 5432 failed: FATAL:  password authentication failed for user "postgres" 