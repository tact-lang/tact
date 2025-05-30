contract ManyDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "init";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 100;
        self.b = true;
        self.c = "changed";
        self.d = 5;
        self.e = false;
        self.f = "opt";
    }
}
