contract ManyPrimitiveFields {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;
    sl: Slice;
    bl: Builder;

    init() {
        self.i = 123;
        self.b = true;
        self.s = "Hello";
        self.addr = myAddress();
        self.c = emptyCell();
        self.sl = self.c.asSlice();
        self.bl = beginCell();
    }
}