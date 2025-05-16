contract OptAndDefaults {
    a: Int?;
    b: Int = 5;
    c: Bool?;
    d: Bool = false;
    e: String?;
    f: String = "hi";

    init() {
        self.a = null;
        self.b = 10;
        self.c = null;
        self.d = true;
        self.e = null;
        self.f = "bye";
    }
}