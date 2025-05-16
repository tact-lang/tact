contract InitDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "abc";
    d: Int?;
    e: Bool?;
    f: String?;
    init() {
        self.d = null;
        self.e = null;
        self.f = null;
    }
}