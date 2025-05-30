contract OptionalPrimitives {
    n: Int?;
    s: String?;
    b: Bool?;
    c: Cell?;
    sl: Slice?;
    a: Address?;
    init() {
        self.n = null;
        self.s = null;
        self.b = null;
        self.c = null;
        self.sl = null;
        self.a = null;
    }
}