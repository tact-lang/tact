contract AllDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "str";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 2;
        self.b = false;
        self.c = "abc";
        self.d = null;
        self.e = null;
        self.f = null;
    }
}
