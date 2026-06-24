contract DifferentDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "foo";
    d: Int? = null;
    e: String? = null;
    f: Bool? = null;

    init() {
        self.a = 10;
        self.b = false;
        self.c = "bar";
        self.d = null;
        self.e = null;
        self.f = null;
    }
}