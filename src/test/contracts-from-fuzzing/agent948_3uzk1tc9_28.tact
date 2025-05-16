contract OptionalMixed {
    a: Int?;
    b: String;
    c: Bool?;
    d: Cell;
    e: Slice?;
    f: Builder;

    init() {
        self.a = 42;
        self.b = "hey";
        self.c = null;
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
    }
}