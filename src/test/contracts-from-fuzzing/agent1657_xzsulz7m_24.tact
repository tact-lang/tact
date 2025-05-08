contract OptionalMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
    f: Cell?;
    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = myAddress();
        self.e = null;
        self.f = emptyCell();
    }
}