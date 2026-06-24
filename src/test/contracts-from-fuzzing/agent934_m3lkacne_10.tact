contract OptionalPrimitiveFields {
    n1: Int?;
    n2: Bool?;
    n3: String?;

    init() {
        self.n1 = null;
        self.n2 = true;
        self.n3 = null;
    }
}