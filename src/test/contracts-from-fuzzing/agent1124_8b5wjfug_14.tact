contract ManyPrimitiveFields {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "string";
        self.c = emptyCell();
        self.sl = self.c.asSlice();
        self.addr = myAddress();
    }
}