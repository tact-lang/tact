contract ManyPrimitives {
    a: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    addr: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.s = "abc";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.bu = beginCell();
        self.addr = myAddress();
    }
}