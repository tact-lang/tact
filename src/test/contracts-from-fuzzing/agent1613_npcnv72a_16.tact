contract MixedFields {
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
        self.i=1; self.b=true; self.s="hi";
        self.c=emptyCell(); self.sl=emptyCell().asSlice();
        self.a=myAddress();
        self.oi=null; self.ob=false; self.os=null;
        self.oc=null; self.osl=null; self.oa=null;
    }
}
