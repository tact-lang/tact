contract MixedPrimitives {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;

    init() {
        self.i = 10;
        self.b = true;
        self.s = "sample";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.addr = myAddress();
    }
}