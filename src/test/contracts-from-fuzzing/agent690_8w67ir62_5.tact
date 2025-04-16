contract OptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;

    init() {
        self.i = null;
        self.b = true;
        self.s = null;
        self.c = null;
    }
}