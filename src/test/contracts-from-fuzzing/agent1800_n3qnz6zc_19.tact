contract MixedPrimitives {
    i1: Int;
    b1: Bool;
    s1: String;
    c1: Cell;
    a1: Address;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    oa: Address?;

    init() {
        self.i1 = 1;
        self.b1 = true;
        self.s1 = "test";
        self.c1 = emptyCell();
        self.a1 = myAddress();
        self.oi = null;
        self.ob = false;
        self.os = null;
        self.oc = null;
        self.oa = myAddress();
    }
}