contract MixTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
    oc: Cell?;
    osl: Slice?;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "hi";
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.oi = null;
        self.ob = null;
        self.os = null;
        self.oa = null;
        self.oc = null;
        self.osl = null;
    }
}