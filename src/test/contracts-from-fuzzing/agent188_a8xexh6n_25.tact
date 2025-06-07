contract ManyDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 42;
        self.b = true;
        self.c = "zzz";
        self.d = 1;
        self.e = true;
        self.f = "filled";
    }
}