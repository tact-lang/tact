contract CombinedBig {
    aa: Int = 1;
    bb: Bool = true;
    cc: Bool? = null;
    dd: String = "hi";
    ee: String? = null;
    ff: Int as uint8 = 7;
    gg: Int as int16 = -4;
    hh: Int? as uint8 = null;
    ii: Int? as int16 = null;

    init() {
        self.aa=1; self.bb=true; self.cc=null; self.dd="hi";
        self.ee=null; self.ff=7; self.gg=-4; self.hh=null; self.ii=null;
    }
}