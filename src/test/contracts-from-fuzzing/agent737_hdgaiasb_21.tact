contract ManyPrimitives {
    i: Int;
    u: Int as uint32;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;

    init() {
        self.i = 7;
        self.u = 8;
        self.b = true;
        self.s = "hi";
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}
