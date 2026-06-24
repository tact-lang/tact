contract MixedPrimitiveFields {
    a: Int;
    b: Bool = true;
    c: Int?;
    d: String = "hi";
    e: Bool?;

    init() {
        self.a = 123;
        self.c = null;
        self.e = null;
    }
}
