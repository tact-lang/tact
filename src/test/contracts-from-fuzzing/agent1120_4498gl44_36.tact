contract OptionalsAndDefaults {
    a: Int?;
    b: Bool = false;
    c: String?;
    d: String = "test";

    init() {
        self.a = null;
        self.c = null;
    }
}