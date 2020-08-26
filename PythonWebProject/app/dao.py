from app.models import *

def san_bay_read_all():
    return SanBay.query.all()

def may_bay_read_all():
    return MayBay.query.all()

def chuyen_bay_read_all():
    return ChuyenBay.query.all()