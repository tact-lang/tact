contract OptionalsAndDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int = 42;
    e: Bool = false;
    f: String = "hello";

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
    }
}
