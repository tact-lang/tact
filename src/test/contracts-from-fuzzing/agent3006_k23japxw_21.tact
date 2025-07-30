contract OptionalsVsDefaults {
    a: Int?;
    b: Int? = null;
    c: Bool? = null;
    d: String?;
    e: Bool = true;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = false;
    }
}
