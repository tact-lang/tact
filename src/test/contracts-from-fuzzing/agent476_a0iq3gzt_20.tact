contract ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;
    sl: Slice;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oaddr: Address?;
    oc: Cell?;
    osl: Slice?;

    init() {
        self.i=1; self.b=true; self.s="s"; self.addr=myAddress();
        self.c=emptyCell(); self.sl=emptyCell().asSlice();
        self.oi=null; self.ob=null; self.os=null; self.oaddr=null;
        self.oc=null; self.osl=null;
    }
}
