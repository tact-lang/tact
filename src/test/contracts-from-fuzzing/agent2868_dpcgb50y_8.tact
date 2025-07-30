contract AllPrimitiveFields {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;

    init() {
        self.i = 1;
        self.b = false;
        self.s = "abc";
        self.c = emptyCell();
        self.sl = self.c.asSlice();
        self.a = myAddress();
    }
}