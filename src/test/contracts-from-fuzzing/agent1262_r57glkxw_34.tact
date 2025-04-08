contract OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: Address?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = null;
    }
}