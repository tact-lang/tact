contract ManyPrimitiveFields {
    i: Int = 1;
    b: Bool = false;
    s: String = "a";
    addr: Address;
    sl: Slice;
    c: Cell;
    build: Builder;

    init() {
        self.i = 42;
        self.b = true;
        self.s = "test";
        self.addr = myAddress();
        self.sl = emptyCell().asSlice();
        self.c = emptyCell();
        self.build = beginCell();
    }
}