contract MixedOrdering {
    b: Bool;
    i: Int;
    a: Address;
    s: String;
    c: Cell;
    sl: Slice;

    init() {
        self.b = true;
        self.i = 42;
        self.a = myAddress();
        self.s = "hello";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}
