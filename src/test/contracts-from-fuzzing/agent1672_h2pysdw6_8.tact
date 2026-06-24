contract ManyMixedFields {
    a: Int = 10;
    b: Bool = false;
    c: Int?;
    d: Bool?;
    e: String = "e";
    f: String?;

    init() {
        self.c = 5;
        self.d = null;
        self.f = "string";
    }
}
