contract PrimitiveFields {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;

    init() {
        self.i = 42;
        self.b = true;
        self.s = "test";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.addr = myAddress();
    }
}