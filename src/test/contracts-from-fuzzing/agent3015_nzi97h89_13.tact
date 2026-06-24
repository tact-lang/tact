contract ManyOptionals {
    aa: Int?;
    bb: Int?;
    cc: String?;
    dd: Bool?;
    ee: Cell?;
    ff: Address?;
    gg: Slice?;
    hh: Builder?;
    ii: String?;

    init() {
        self.aa = 1;
        self.bb = null;
        self.cc = "ok";
        self.dd = null;
        self.ee = emptyCell();
        self.ff = myAddress();
        self.gg = emptyCell().asSlice();
        self.hh = beginCell();
        self.ii = null;
    }
}