contract OptionalPrimitiveFields {
    a: Int?;
    b: String?;
    c: Bool?;

    init() {
        self.a = null;
        self.b = "filled";
        self.c = null;
    }
}
