contract ChainDefaults {
    a: Int = 1;
    b: Int? = null;
    c: Bool? = false;
    d: String? = null;
    e: Bool = true;
    f: String = "s";

    init() {
        self.a = 2;
        self.b = 3;
        self.c = true;
        self.d = "x";
        self.e = false;
        self.f = "y";
    }
}