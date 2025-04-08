contract JustOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: Address?;
    f: String?;

    init() {
        self.a = null;
        self.b = false;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
    }
}
