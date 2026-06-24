contract OptionalPrimitiveFields {
    n: Int?;
    s: String?;
    b: Bool?;
    a: Address?;
    c: Cell?;
    sl: Slice?;

    init() {
        self.n = null;
        self.s = null;
        self.b = null;
        self.a = null;
        self.c = null;
        self.sl = null;
    }
}