import pymysql
from datetime import date, datetime


con = pymysql.connect("localhost", "root", "12345678", "agoda")

product=[]
i=0


username = "Kenton"
password = "87654321"

db = pymysql.connect("localhost", "root", "12345678", "agoda")
with db.cursor() as cursor:
	found=False
	cursor.execute("""SELECT member_ID from member_data WHERE member_Username='""" + username +"""'""")
	x=(cursor.fetchall())
	len_x =len(str(x))
	y= str(x)
	userID=y[2:len_x-4]
	print(y[2:len_x-4])
	print(userID)
