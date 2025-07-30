contract OptionalPrimitives {
    i: Int?;
    b: Bool?;
    a: Address?;
    c: Cell?;
    sl: Slice?;

    init() {
        self.i = null;
        self.b = null;
        self.a = null;
        self.c = null;
        self.sl = null;
    }
}