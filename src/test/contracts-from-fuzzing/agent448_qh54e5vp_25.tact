contract OptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;

    init() {
        self.i = 42;
        self.b = null;
        self.s = "hello";
        self.a = null;
    }
}