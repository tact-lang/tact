contract OptPrimitives {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;

    init() {
        self.a = 7;
        self.b = true;
        self.c = null;
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = null;
    }
}