contract EmptyOptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Builder?;
    f: Slice?;
    g: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = null;
    }
}