contract WideVariety {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    osl: Slice?;
    oaddr: Address?;

    init() {
        self.i=1; self.b=true; self.s="x"; self.c=emptyCell(); self.sl=emptyCell().asSlice(); self.addr=myAddress();
        self.oi=null; self.ob=null; self.os=null; self.oc=null; self.osl=null; self.oaddr=null;
    }
}