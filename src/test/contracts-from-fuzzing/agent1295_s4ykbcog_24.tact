contract OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;

    init() {
        self.a = null;
        self.b = null;
        self.c = "test";
        self.d = null;
        self.e = emptyCell();
        self.f = self.e.asSlice();
        self.g = beginCell();
    }
}