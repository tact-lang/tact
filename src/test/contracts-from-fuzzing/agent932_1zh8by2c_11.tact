contract OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: Slice?;

    init() {
        self.a = 5;
        self.b = null;
        self.c = emptyCell();
        self.d = null;
        self.e = emptyCell().asSlice();
    }
}
