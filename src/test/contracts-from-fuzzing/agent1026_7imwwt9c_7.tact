contract TestContract {
    i: Int;
    u: Int as uint32;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;
    sl: Slice;

    init() {
        self.i = -1;
        self.u = 42;
        self.b = true;
        self.s = "test";
        self.addr = myAddress();
        self.c = emptyCell();
        self.sl = self.c.asSlice();
    }
}