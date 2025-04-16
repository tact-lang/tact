contract WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "def";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 42;
        self.b = false;
        self.c = "changed";
        self.d = 99;
        self.e = true;
        self.f = "hi";
    }
}
