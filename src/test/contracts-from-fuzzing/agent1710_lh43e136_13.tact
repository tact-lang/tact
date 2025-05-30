contract OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = "hello";
    }
}