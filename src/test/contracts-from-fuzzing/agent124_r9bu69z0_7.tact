contract ManyPrimitiveFields {
    i: Int;
    b: Bool;
    addr: Address;
    c: Cell;
    sl: Slice;
    s: String;

    init() {
        self.i = 1;
        self.b = true;
        self.addr = myAddress();
        self.c = emptyCell();
        self.sl = self.c.asSlice();
        self.s = "hi";
    }
}