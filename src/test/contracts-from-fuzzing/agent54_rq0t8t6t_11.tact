contract SimpleOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = null;
    }
}