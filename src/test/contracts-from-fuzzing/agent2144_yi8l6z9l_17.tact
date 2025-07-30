contract OptionalChain {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: String?;
    g: String?;

    init() {
        self.a = null;
        self.b = 2;
        self.c = null;
        self.d = true;
        self.e = null;
        self.f = "foo";
        self.g = null;
    }
}
