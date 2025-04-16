contract OptionalPrimitiveFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;

    init() {
        self.a = 42;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = "hello";
    }
}