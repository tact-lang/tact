contract EmptyOptFields {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    ce: Cell?;
    sl: Slice?;

    init() {
        self.i = null;
        self.b = null;
        self.s = null;
        self.a = null;
        self.ce = null;
        self.sl = null;
    }
}