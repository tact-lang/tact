contract ManyOptionalsMix {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Slice?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}