contract Mix {
    a: Int as uint4;
    b: Int as int64;
    c: Bool;
    d: Slice;
    e: String?;
    f: Address?;
    g: Cell;

    init() {
        self.a = 9;
        self.b = -47;
        self.c = true;
        self.d = emptyCell().asSlice();
        self.e = null;
        self.f = null;
        self.g = emptyCell();
    }
}