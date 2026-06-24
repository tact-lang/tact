contract OptionalPrimitives {
    i: Int?;
    b: Bool?;
    a: Address?;
    c: Cell?;
    s: Slice?;
    str: String?;

    init() {
        self.i = null;
        self.b = true;
        self.a = null;
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.str = null;
    }
}