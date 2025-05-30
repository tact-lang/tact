contract MultiPrimitiveFields {
    n: Int;
    f: Bool;
    s: String;
    addr: Address;
    c: Cell;
    sl: Slice;

    init() {
        self.n = 0;
        self.f = false;
        self.s = "";
        self.addr = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}