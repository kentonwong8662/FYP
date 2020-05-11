from flask import Flask, render_template, request, url_for, redirect, session
from flask_mail import Mail, Message
import pymysql
from datetime import date, datetime


today = str(date.today())

username = 0
userID = 0

app = Flask(__name__)

mail=Mail(app)

app.config['MAIL_SERVER']='smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USERNAME'] = 'agoda.fyp.auto@gmail.com'
app.config['MAIL_PASSWORD'] = 'password=12345'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True
mail = Mail(app)

db = pymysql.connect("localhost", "root", "12345678", "agoda")

cursor = db.cursor() 


@app.route("/")
def main():
	return render_template("agoda-ori.html")

@app.route("/Agoda-platform")
def Agoda_platform():
	return render_template("agoda.html")



@app.route("/reg")
def reg():

	return render_template("agoda-Registor.html")




@app.route("/reg_get", methods = ['POST', 'GET'])
def reg_get():
	today = str(date.today())
	if request.method == 'POST':

		fir_nam=request.form['first_name']
		las_nam=request.form['last_name']
		email_address=request.form['email']
		phone_no=request.form['phone']
		home_address=request.form['address']
		usrn = request.form['Username']
		uspw = request.form['pwd']
		nation = request.form['nation']



		db = pymysql.connect("localhost", "root", "12345678", "agoda")

		cursor = db.cursor() 


		sql = """INSERT INTO member_data (member_Firstname,member_Surname,member_Username,member_password,member_Email,member_Address, member_Location,member_Phone) VALUES ('%s','%s','%s','%s','%s','%s','%s','%d')"""\
	  %(str(fir_nam),str(las_nam),str(usrn),str(uspw),str(email_address),str(home_address),str(nation),int(phone_no))


	  
		cursor.execute(sql)
		db.commit()


		email_mail=[]
		email_mail.append(email_address)
		db.close()
		msg = Message('Welcome to become member of Agoda', sender = 'agoda.fyp.auto@gmail.com', recipients = email_mail[0].split())
		msg.html = render_template("agoda-mail.html",fir_nam=str(fir_nam), las_nam=str(las_nam), email_address=str(email_address), phone_no=str(phone_no), home_address=str(home_address), usrn=str(usrn))
   
		##mail.send(msg)
		return redirect(url_for("login"))


@app.route("/trips")
def trips():
	db = pymysql.connect("localhost", "root", "12345678", "agoda")
	with db.cursor() as cursor:
		cursor.execute( """SELECT * from trips """)
		data=(cursor.fetchall())
	db.close()
	return render_template("agoda-trips.html", data = data)

@app.route("/add_trips")
def add_trips():

	if username == 0:

		return render_template("agoda-nologin.html")

	else:
		return render_template("agoda-trips-add.html")

@app.route("/add_trips_get", methods = ['POST', 'GET'])
def add_trips_get():
	today = str(date.today())
	if request.method == 'POST':

		trip_title=request.form['trip_title']
		trip_Information=request.form['trip_Information']
		trip_Price=request.form['trip_Price']
		trip_Stock=request.form['trip_Stock']
		trip_type=request.form['trip_type']
		local_guide=request.form['local_guide']
		trip_location=request.form['trip_location']


		db = pymysql.connect("localhost", "root", "12345678", "agoda")

		cursor = db.cursor() 


		sql = """INSERT INTO trips (trips_Title,trips_Intro,trips_Price,trips_Stock,trips_Type, member_ID, trip_guide, trips_Location) VALUES ('%s','%s','%d','%d','%s','%d','%d','%s')"""\
	  %(str(trip_title),str(trip_Information),int(trip_Price),int(trip_Stock),str(trip_type),int(userID),int(local_guide),str(trip_location))


	  
		cursor.execute(sql)
		db.commit()

		##mail.send(msg)
		return render_template("agoda-success.html")
	else:
		return redirect(url_for("error"))


@app.route("/blog")
def blog():
	db = pymysql.connect("localhost", "root", "12345678", "agoda")
	with db.cursor() as cursor:
		cursor.execute( """SELECT * from blog """)
		blog=(cursor.fetchall())
	db.close()
	return render_template("agoda-blog.html", blog= blog)


@app.route("/products")
def products():
	db = pymysql.connect("localhost", "root", "12345678", "agoda")
	with db.cursor() as cursor:
		cursor.execute( """SELECT * from product """)
		product=(cursor.fetchall())
	db.close()

	return render_template("agoda-products.html",product = product)

@app.route("/add_product")
def add_product():

	if username == 0:

		return render_template("agoda-nologin.html")

	else:
		return render_template("agoda-products-add.html")

@app.route("/add_product_get", methods = ['POST', 'GET'])
def add_product_get():
	today = str(date.today())
	if request.method == 'POST':

		product_name=request.form['product_name']
		Product_Information=request.form['Product_Information']
		Product_Price=request.form['Product_Price']
		Product_Stock=request.form['Product_Stock']


		db = pymysql.connect("localhost", "root", "12345678", "agoda")

		cursor = db.cursor() 


		sql = """INSERT INTO product (product_Name,product_Intro,product_Price,Product_Stock, business_ID	) VALUES ('%s','%s','%d','%d','%d')"""\
	  %(str(product_name),str(Product_Information),int(Product_Price),int(Product_Stock), int(userID))


	  
		cursor.execute(sql)
		db.commit()

		##mail.send(msg)
		return render_template("agoda-success.html")
	else:
		return redirect(url_for("error"))



@app.route("/login" ,methods = ['POST', 'GET'])
def login():
	if username != 0:
		return redirect(url_for("profile"))
	
	else:
		return render_template("agoda-login.html")

@app.route("/log", methods = ['POST', 'GET'])
def log():
	if request.method == 'POST':
   
		login = request.form
		username = request.form["username"]
		password = request.form["password"]

		db = pymysql.connect("localhost", "root", "12345678", "agoda")
		with db.cursor() as cursor:
			found=False
			a = """SELECT member_password from member_data WHERE member_Username='""" + username+"""'"""
			cursor.execute(a)
			x=(cursor.fetchall())

			len_x =len(str(x))
			y= str(x)


			if password ==  y[3:len_x-5] and ((y[3:len_x-5])!= ""):
				cursor.execute("""SELECT member_ID from member_data WHERE member_Username='""" + username+"""'""")
				
				
				cusid_db=(cursor.fetchall()[0])
				str_cusid_db = str(cusid_db)
				len_cusid_db = len(str(cusid_db))
				cursor.execute("""SELECT member_ID from member_data WHERE member_Username='""" + username +"""'""")
				x=(cursor.fetchall())
				len_x =len(str(x))
				y= str(x)
				userID=y[2:len_x-4]
				found=True
				return redirect(url_for("profile"))
				global username
				global userID

			else:
				username = 0
				userID
				global username
				global userID
				return render_template("agoda-login-error.html")
		db.close()
	return render_template("agoda-userprofile.html")


@app.route('/profile',methods = ['POST', 'GET'])

def profile():

	db = pymysql.connect("localhost", "root", "12345678", "agoda")
	with db.cursor() as cursor:
		cursor.execute( """SELECT * from member_data Where member_Username = '"""+username+"""'""")
		customerinfo=(cursor.fetchall())
	db.close()
	
	

	return render_template("agoda-userprofile.html",customerinfo = customerinfo)



@app.route("/logout", methods = ['POST', 'GET'])
def logout():
	if request.method == 'POST':
		username = 0
		global username

	return redirect(url_for("login"))

@app.route("/login_error")
def login_error():
		render_template("agoda-login-error.html")

@app.route("/error")
def error():
	render_template("agoda-error.html")

@app.route("/success")
def success():
	render_template("agoda-success.html")

if __name__ == "__main__":
	app.debug = True
	app.run(host="0.0.0.0", port=8000)
