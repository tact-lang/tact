contract LargeOptionalMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = "hi";
        self.d = 4;
        self.e = null;
        self.f = null;
    }
}