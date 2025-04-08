contract ManyPrimitives {
    a: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.s = "test";
        self.c = emptyCell();
        self.sl = self.c.asSlice();
        self.addr = myAddress();
    }
}