contract OptionalsAndDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int = 5;
    e: Bool = true;
    f: String = "hello";

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}