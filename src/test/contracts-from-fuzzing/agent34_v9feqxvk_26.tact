contract ManyOptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Slice?;
    f: Cell?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
    }
}