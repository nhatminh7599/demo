from app import db, admin, dao
from sqlalchemy import Column, Integer, String, Float, ForeignKey, Boolean,DateTime, Date, DECIMAL, Time, Text
from sqlalchemy.orm import relationship
from flask_admin.contrib.sqla import ModelView
from flask_login import UserMixin, current_user, logout_user
from flask_admin import BaseView, expose
from flask import redirect


class NhanVienView(ModelView):
    column_display_pk = True

    def is_accessible(self):
        return current_user.is_authenticated and current_user.maloai == 1


class SanBay (db.Model):
    masanbay = Column(Integer, primary_key=True, autoincrement=True)
    tensanbay = Column(String(50), nullable=False)
    diadiem = Column(String(50), nullable=False)
    sanbaycatcanh = relationship('TuyenBay', backref="sanbaycatcanh", lazy=True, foreign_keys='TuyenBay.masanbaycatcanh')
    sanbayhacanh = relationship('TuyenBay', backref="sanbayhacanh", lazy=True, foreign_keys='TuyenBay.masanbayhacanh')

    def __str__(self):
        return self.tensanbay

class MayBay (db.Model):
    mamaybay = Column(Integer, primary_key=True, autoincrement=True)
    tenmaybay = Column(String(20), nullable=False)
    tenhang = Column(String(50), nullable=False)
    chuyenbay = relationship('ChuyenBay', backref="maybay", lazy=True)

    def __str__(self):
        return self.tenmaybay

class NguoiDung (db.Model):
    manguoidung = Column(Integer, primary_key=True, autoincrement=True)
    ten = Column(String(50), nullable=False)
    cmnd = Column(Integer, nullable=False)
    sdt = Column(String(10), nullable=False)
    email = Column(String(50), nullable=True)
    diachi = Column(String(50), nullable=False)
    gioitinh = Column(Boolean, default=True)
    vemaybay = relationship('VeMayBay', backref="nguoidung", lazy=True)
    taikhoan = relationship('TaiKhoan', backref='nguoidung', lazy=True)

    def __str__(self):
        return self.ten

class TuyenBay (db.Model):
    matuyenbay = Column(Integer, primary_key=True, autoincrement=True)
    thoigianbay = Column(Integer, nullable=False)
    masanbaycatcanh = Column(Integer, ForeignKey(SanBay.masanbay), nullable=False)
    masanbayhacanh = Column(Integer, ForeignKey(SanBay.masanbay), nullable=False)
    chuyenbay = relationship('ChuyenBay', backref="tuyenbay", lazy=True)

    def __str__(self):
        return self.sanbaycatcanh.tensanbay + " đến " + self.sanbayhacanh.tensanbay


class ChuyenBay (db.Model):
    machuyenbay = Column(Integer, primary_key=True, autoincrement=True)
    ngaykhoihanh = Column(Date, nullable=False)
    giocatcanh = Column(Time, nullable=False)
    mamaybay = Column(Integer, ForeignKey(MayBay.mamaybay), nullable=False)
    matuyenbay = Column(Integer, ForeignKey(TuyenBay.matuyenbay), nullable=False)
    ghichu = Column(Text, nullable=False)
    vemaybay = relationship('VeMayBay', backref="chuyenbay", lazy=True)
    sochongoi = relationship('SoChoNgoi', backref="chuyenbay", lazy=True)

    def __str__(self):
        return self.tuyenbay.__str__()

class LoaiVe (db.Model):
    maloaive = Column(Integer, primary_key=True, autoincrement=True)
    tenloaive = Column(String(20), nullable=False)
    vemaybay = relationship('VeMayBay', backref="loaive", lazy=True)
    sochongoi = relationship('SoChoNgoi', backref="loaive", lazy=True)

    def __str__(self):
        return self.tenloaive

class VeMayBay (db.Model):
    mave = Column(Integer, primary_key=True, autoincrement=True)
    ngaykhoitao = Column(DateTime, nullable=False)
    maloaive = Column(Integer, ForeignKey(LoaiVe.maloaive), nullable=False)
    machuyenbay = Column(Integer, ForeignKey(ChuyenBay.machuyenbay), nullable=False)
    manguoidung = Column(Integer, ForeignKey(NguoiDung.manguoidung), nullable=False)
    lydohuy = Column(String(20), nullable=True)
    phihuy = Column(DECIMAL(11, 2), nullable=True)
    giamgia = Column(Float, default=0)

class SoChoNgoi (db.Model):
    machuyenbay = Column(Integer, ForeignKey(ChuyenBay.machuyenbay), primary_key=True, nullable=False)
    maloaive = Column(Integer, ForeignKey(LoaiVe.maloaive), primary_key=True, nullable=False)
    soluong = Column(Integer, nullable=False)
    giave = Column(DECIMAL(11, 2), nullable=False)

class LoaiTaiKhoan (db.Model):
    maloai = Column(Integer, primary_key=True, autoincrement=True)
    tenloai = Column(String(50), nullable=False)
    taikhoan = relationship('TaiKhoan', backref='loaitaikhoan', lazy=True)

    def __str__(self):
        return self.tenloai

class TaiKhoan (db.Model, UserMixin):
    id = Column(Integer, primary_key=True, autoincrement=True)
    tentaikhoan = Column(String(20), nullable=False)
    matkhau = Column(String(100), nullable=False)
    active = Column(Boolean, default=True)
    manguoidung = Column(Integer, ForeignKey(NguoiDung.manguoidung), nullable=False)
    maloai = Column(Integer, ForeignKey(LoaiTaiKhoan.maloai), nullable=False)

    def __str__(self):
        return self.tentaikhoan

class ThemLichBay(BaseView):
    @expose("/")
    def index(self):
        sanbay = dao.san_bay_read_all()
        maybay = dao.may_bay_read_all()
        chuyenbay = dao.chuyen_bay_read_all()
        return self.render("admin/quan-ly-lich-bay.html", sanbay=sanbay, maybay=maybay, chuyenbay=chuyenbay)

    def is_accessible(self):
        return current_user.is_authenticated and current_user.maloai == 1

class LogoutView(BaseView):
    @expose("/")
    def index(self):
        logout_user()
        return redirect("/admin")
    def is_accessible(self):
        return current_user.is_authenticated


admin.add_view(NhanVienView(SanBay, db.session))
admin.add_view(NhanVienView(MayBay, db.session))
admin.add_view(NhanVienView(NguoiDung, db.session))
admin.add_view(NhanVienView(TuyenBay, db.session))
admin.add_view(NhanVienView(ChuyenBay, db.session))
admin.add_view(NhanVienView(LoaiVe, db.session))
admin.add_view(NhanVienView(VeMayBay, db.session))
admin.add_view(NhanVienView(SoChoNgoi, db.session))
admin.add_view(NhanVienView(TaiKhoan, db.session))
admin.add_view(NhanVienView(LoaiTaiKhoan, db.session))
admin.add_view(ThemLichBay(name="Quản lý lịch bay"))
admin.add_view(LogoutView(name="Log out"))


if __name__ == "__main__":
    db.create_all()