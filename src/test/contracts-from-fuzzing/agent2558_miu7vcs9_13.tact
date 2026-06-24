contract BigOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: String?;
    e: String?;
    f: Bool?;
    g: Bool?;
    h: Int?;

    init() {
        self.a = null;
        self.b = 1;
        self.c = null;
        self.d = "abc";
        self.e = null;
        self.f = true;
        self.g = null;
        self.h = -10;
    }
}