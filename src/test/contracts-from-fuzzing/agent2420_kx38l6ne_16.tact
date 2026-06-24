contract MixedPrimitives {
    addr: Address;
    s: String;
    b: Bool;
    i: Int;
    c: Cell;
    sl: Slice;

    init() {
        self.addr = myAddress();
        self.s = "test";
        self.b = true;
        self.i = 123;
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}