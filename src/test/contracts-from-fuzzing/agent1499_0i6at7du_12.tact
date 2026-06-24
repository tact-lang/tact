contract MixedOptions {
    i: Int;
    iopt: Int?;
    b: Bool;
    bopt: Bool?;
    s: Slice;
    sopt: Slice?;
    c: Cell;
    copt: Cell?;
    addr: Address;
    addropt: Address?;
    str: String;
    stropt: String?;

    init() {
        self.i = 1;
        self.iopt = null;
        self.b = true;
        self.bopt = null;
        self.s = emptyCell().asSlice();
        self.sopt = null;
        self.c = emptyCell();
        self.copt = null;
        self.addr = myAddress();
        self.addropt = null;
        self.str = "foo";
        self.stropt = null;
    }
    receive() {}
}