contract FieldOrdering {
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
    i: Int;
    sl: Slice;

    init() {
        self.b = false;
        self.s = "abc";
        self.c = emptyCell();
        self.a = myAddress();
        self.i = 42;
        self.sl = emptyCell().asSlice();
    }
}
