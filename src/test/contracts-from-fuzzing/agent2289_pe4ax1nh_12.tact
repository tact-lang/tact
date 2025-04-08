contract OptAndDefaults {
    a: Int?;
    b: Int = 42;
    c: Bool = false;
    d: Bool?;
    e: String = "hi";
    f: String?;

    init() {
        self.a = null;
        self.d = true;
        self.f = null;
    }
}