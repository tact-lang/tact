contract LotsOfMixedFields {
    i1: Int;
    i2: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    c1: Cell;
    c2: Cell;
    sl1: Slice;
    sl2: Slice;
    a1: Address;
    a2: Address;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    osl: Slice?;
    oa: Address?;

    init() {
        self.i1=1; self.i2=2; self.b1=true; self.b2=false; self.s1="a"; self.s2="b";
        self.c1=emptyCell(); self.c2=emptyCell(); self.sl1=emptyCell().asSlice(); self.sl2=emptyCell().asSlice();
        self.a1=myAddress(); self.a2=myAddress();
        self.oi = null; self.ob = null; self.os = null; self.oc = null; self.osl = null; self.oa = null;
    }
}