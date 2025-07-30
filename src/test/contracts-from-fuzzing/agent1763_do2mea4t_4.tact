contract OptionalPrimitiveFields {
    a: Bool?;
    b: String?;
    c: Int?;
    d: Cell?;
    e: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}