contract OptsAndDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Int = 42;
    e: Bool = true;
    f: String = "default";

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = 24;
        self.e = false;
        self.f = "overridden";
    }
}