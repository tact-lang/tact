contract Test13 {
    a: Int = 1;
    b: Bool = true;
    c: String = "ok";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 11;
        self.b = false;
        self.c = "changed";
        self.d = 42;
        self.e = true;
        self.f = "val";
    }
}