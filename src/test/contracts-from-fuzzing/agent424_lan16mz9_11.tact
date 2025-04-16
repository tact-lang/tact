contract InitDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 42;
        self.b = false;
        self.c = "world";
        self.d = 7;
        self.e = true;
        self.f = null;
    }
}