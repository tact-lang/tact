contract OptPrimitives {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
    }
}
