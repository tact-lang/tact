contract OptionalVariants {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;

    init() {
        self.i = null;
        self.b = true;
        self.s = null;
        self.a = null;
        self.c = emptyCell();
        self.sl = null;
    }
}
