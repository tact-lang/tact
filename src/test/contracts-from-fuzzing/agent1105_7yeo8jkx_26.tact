contract OptionalsAndDefaults {
    a: Int?;
    b: Bool?;
    c: Int = 1;
    d: Bool = false;

    init() {
        self.a = null;
        self.b = null;
        self.c = 2;
        self.d = true;
    }
}