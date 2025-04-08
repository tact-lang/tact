contract Test {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;

    init() {
        self.a = -100;
        self.b = true;
        self.c = "qqq";
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = myAddress();
    }
}