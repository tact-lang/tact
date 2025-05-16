contract AllOptionals {
    a: Int?;
    b: Address?;
    c: Cell?;
    d: Slice?;
    e: Bool?;
    f: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
    }
}