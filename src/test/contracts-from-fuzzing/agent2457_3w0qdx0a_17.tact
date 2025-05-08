contract WeirdMix {
    a: Int?;
    b: Bool;
    c: String?;
    d: Cell;
    e: Bool?;
    f: Slice;
    g: Int;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = emptyCell();
        self.e = null;
        self.f = emptyCell().asSlice();
        self.g = 123;
    }
}