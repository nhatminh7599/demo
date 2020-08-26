from app import app, login, dao
from flask import render_template, redirect, request
from app.models import *
from flask_login import login_user
import hashlib

@app.route("/")
def index():
    return render_template("index.html")

@login.user_loader
def user_loader(user_id):
    return TaiKhoan.query.get(user_id)

@app.route("/login-admin", methods=['GET', 'POST'])
def login_admin():
    if request.method == 'POST':
        tentaikhoan = request.form.get("tentaikhoan")
        matkhau = request.form.get("matkhau")
        matkhau = str(hashlib.md5(matkhau.strip().encode("utf-8")).hexdigest())
        taikhoan = TaiKhoan.query.filter(TaiKhoan.tentaikhoan == tentaikhoan.strip(), TaiKhoan.matkhau == matkhau).first()
        if taikhoan:
            login_user(user=taikhoan)
    return redirect('/admin')

@app.route("/api/lichbay", methods=["GET"])
def get_lich_bay():
    if request.methods == 'GET':
        return dao.san_bay_read_all()


if __name__ == "__main__":
    app.run(debug=True)