contract OneOfEach {
    b: Bool;
    i: Int;
    s: String;
    a: Address;
    sl: Slice;
    c: Cell;

    init() {
        self.b = true;
        self.i = 123;
        self.s = "test";
        self.a = myAddress();
        self.sl = emptyCell().asSlice();
        self.c = emptyCell();
    }
}