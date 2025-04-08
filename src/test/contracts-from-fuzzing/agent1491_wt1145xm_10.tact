contract OptionalPrimitives {
    a: Bool?;
    b: Int?;
    c: String?;
    d: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}