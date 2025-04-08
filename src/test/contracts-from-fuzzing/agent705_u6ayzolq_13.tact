contract OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;

    init() {
        self.a = 10;
        self.b = null;
        self.c = null;
        self.d = "test";
        self.e = null;
    }
}
