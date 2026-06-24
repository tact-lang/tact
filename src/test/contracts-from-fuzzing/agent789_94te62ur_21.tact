contract LargeOptionalDefaults {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Slice?;
    f: Cell?;
    g: Address?;
    h: Int = 1;
    i: Bool = true;

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
