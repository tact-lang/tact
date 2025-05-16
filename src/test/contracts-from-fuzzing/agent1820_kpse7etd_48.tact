contract ManyVariants {
    i: Int;
    iopt: Int?;
    b: Bool;
    bopt: Bool?;
    addr: Address;
    addropt: Address?;
    s: String;
    sopt: String?;
    c: Cell;
    copt: Cell?;
    sl: Slice;
    slopt: Slice?;
    init() {
        self.i = 1;
        self.iopt = null;
        self.b = true;
        self.bopt = false;
        self.addr = myAddress();
        self.addropt = null;
        self.s = "abc";
        self.sopt = null;
        self.c = emptyCell();
        self.copt = null;
        self.sl = emptyCell().asSlice();
        self.slopt = null;
    }
}