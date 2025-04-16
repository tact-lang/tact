contract OptionalFields {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: String?;
    f: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
    }
}
