contract OnlyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "str";
    d: Int? = null;
    e: Bool? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "str";
        self.d = null;
        self.e = null;
    }
}