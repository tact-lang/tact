contract OnlyPrimitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bu: Builder;

    init() {
        self.i = 42;
        self.b = true;
        self.s = "hi";
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.bu = beginCell();
    }
}