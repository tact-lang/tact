contract OptionalEmpty {
    s: String?;
    i: Int?;
    b: Bool?;
    c: Cell?;
    sl: Slice?;
    a: Address?;

    init() {
        self.s = null;
        self.i = null;
        self.b = null;
        self.c = null;
        self.sl = null;
        self.a = null;
    }
}