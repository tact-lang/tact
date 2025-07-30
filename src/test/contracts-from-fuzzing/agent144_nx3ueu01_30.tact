contract ManyFieldsDifferentOrders {
    aa: Int;
    bb: Bool;
    cc: String;
    dd: Int as uint32;
    ee: Bool?;
    ff: String?;
    gg: Int;
    hh: Bool;

    init() {
        self.aa=1; self.bb=true; self.cc="test"; self.dd=22; self.ee=null; self.ff=null; self.gg=42; self.hh=false;
    }
}
