contract OptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    a: Address?;

    init() {
        self.i = null;
        self.b = null;
        self.s = null;
        self.c = null;
        self.a = null;
    }
}