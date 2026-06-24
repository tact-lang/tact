contract MultiTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;

    init() {
        self.i = 42;
        self.b = true;
        self.s = "test";
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}
