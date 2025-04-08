contract PrimitiveMany {
    aa: Int;
    bb: Bool;
    cc: String;
    dd: Cell;
    ee: Slice;
    ff: Address;
    gg: Int as int64;
    hh: Int as uint64;
    ii: Int as uint8;
    jj: Int as int8;

    init() {
        self.aa = 1;
        self.bb = false;
        self.cc = "xyz";
        self.dd = emptyCell();
        self.ee = emptyCell().asSlice();
        self.ff = myAddress();
        self.gg = 10;
        self.hh = 20;
        self.ii = 30;
        self.jj = -5;
    }
}