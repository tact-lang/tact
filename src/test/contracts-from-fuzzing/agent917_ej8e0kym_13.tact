contract NoDefaults {
    a: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
    bldr: Builder;

    init() {
        self.a = 1;
        self.b = true;
        self.s = "s";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.addr = myAddress();
        self.bldr = beginCell();
    }
}