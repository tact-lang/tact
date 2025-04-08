contract OptionsDefaults {
    a: Int?;
    b: Int = 42;
    c: String?;
    d: String = "abc";
    e: Bool?;
    f: Bool = true;
    init() {
        self.a = null;
        self.c = "test";
        self.e = null;
    }
}
