contract OptionalsAndDefaults {
    a: Int?;
    b: String?;
    c: Address?;
    d: Bool = false;
    e: Int = 0;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = true;
        self.e = 123;
    }
}
