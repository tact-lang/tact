contract ManyTypes {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    sl: Slice;
    s: String;
    oi: Int?;
    ob: Bool?;
    oa: Address?;
    oc: Cell?;
    osl: Slice?;
    os: String?;

    init() {
        self.i = 1;
        self.b = true;
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.s = "hi";

        self.oi = null;
        self.ob = null;
        self.oa = null;
        self.oc = null;
        self.osl = null;
        self.os = null;
    }
}