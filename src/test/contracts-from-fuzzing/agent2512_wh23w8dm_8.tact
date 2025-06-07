contract OptionalsAndDefaults {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String = "test";
    f: String?;

    init() {
        self.b = null;
        self.d = null;
        self.f = null;
    }
}