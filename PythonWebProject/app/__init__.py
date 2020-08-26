from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin
from flask_login import LoginManager

app = Flask(__name__)

app.secret_key = "ui21eui2g"

app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:mysql@localhost/ql_maybay?charset=utf8mb4"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True

db = SQLAlchemy(app=app)

admin = Admin(app=app, name="Quan Ly Ve May Bay", template_mode="bootstrap3")
login = LoginManager(app=app)