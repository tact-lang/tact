contract MaxStorageTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    osl: Slice?;
    oa: Address?;
    init() {
        self.i = 5;
        self.b = true;
        self.s = "text";
        self.c = emptyCell();
        self.sl = emptySlice();
        self.a = myAddress();
        self.oi = null;
        self.ob = null;
        self.os = null;
        self.oc = null;
        self.osl = null;
        self.oa = null;
    }
}