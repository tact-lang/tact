contract OptionalFields {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
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
