contract LotsOfOptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: Slice?;
    d: Cell?;
    e: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}