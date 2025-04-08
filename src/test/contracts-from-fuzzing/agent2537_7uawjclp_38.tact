contract OnlyOptionals {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;
    e: Bool?;
    f: Address?;
    g: Cell?;
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = null;
    }
}