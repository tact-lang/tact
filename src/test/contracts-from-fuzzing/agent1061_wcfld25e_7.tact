contract Test {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;

    init() {
        self.a = 1;
        self.b = "s";
        self.c = true;
        self.d = myAddress();
        self.e = emptyCell();
        self.f = self.e.asSlice();
        self.g = beginCell();
    }
}