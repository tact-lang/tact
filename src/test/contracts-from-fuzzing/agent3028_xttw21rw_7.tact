contract ManyPersistent {
    a: Int = 1;
    b: Bool = true;
    c: String = "c";
    d: Bool? = null;
    e: Int? = null;
    f: String? = null;
    g: Bool = false;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = false;
    }
}
