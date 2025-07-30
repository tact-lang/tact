contract MixedPrimitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    ce: Cell;
    sl: Slice;

    init() {
        self.i = 1234;
        self.b = true;
        self.s = "xyz";
        self.a = myAddress();
        self.ce = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}