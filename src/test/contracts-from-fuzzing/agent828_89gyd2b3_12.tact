contract OptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;

    init() {
        self.i = 1;
        self.b = null;
        self.s = null;
        self.a = null;
        self.c = emptyCell();
    }
}