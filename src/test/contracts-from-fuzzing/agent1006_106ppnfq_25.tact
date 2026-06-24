contract MixedDefaults {
    a: Int = 0;
    b: String = "test";
    c: Bool = true;
    d: Int?;
    e: String?;
    f: Bool?;
    init() {
        self.d = null;
        self.e = null;
        self.f = null;
    }
}
