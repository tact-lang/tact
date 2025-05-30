contract Test {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: String;
    f: Slice;
    g: Builder;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = "x";
        self.f = emptyCell().asSlice();
        self.g = beginCell();
    }
}