contract TestContract {
    i: Int;
    b: Bool;
    s: String;
    sl: Slice;
    c: Cell;
    addr: Address;

    init() {
        self.i = 42;
        self.b = true;
        self.s = "test";
        self.sl = emptyCell().asSlice();
        self.c = emptyCell();
        self.addr = myAddress();
    }
}
