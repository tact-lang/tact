contract AllOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Address?;
    f: Cell?;
    g: Slice?;

    init() {
        self.a = null; self.b = null; self.c = null;
        self.d = null; self.e = null; self.f = null; self.g = null;
    }
}
