contract ExtremeOptional {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;

    init() {
        self.a = null;
        self.b = 123;
        self.c = null;
        self.d = true;
        self.e = null;
        self.f = "hi";
    }
}