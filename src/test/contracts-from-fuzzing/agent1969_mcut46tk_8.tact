contract OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
    }
}