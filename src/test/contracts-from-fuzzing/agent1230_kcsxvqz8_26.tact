contract OptionalsWithDefaults {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int = 7;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = 42;
    }
}