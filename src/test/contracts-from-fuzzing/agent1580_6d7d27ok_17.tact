contract FieldsManyTypes {
    i: Int;
    b: Bool;
    s: String;
    o: Address;
    c: Cell;
    sl: Slice;
    bu: Builder;
    opti: Int?;
    opts: String?;
    optb: Bool?;

    init() {
        self.i = 10;
        self.b = true;
        self.s = "hello";
        self.o = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.bu = beginCell();
        self.opti = null;
        self.opts = null;
        self.optb = null;
    }
}