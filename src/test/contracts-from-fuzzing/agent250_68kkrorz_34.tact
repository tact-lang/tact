contract MultiDefaultsAndOpts {
    a: Int? = null;
    b: Bool? = null;
    s: String = "hello";
    f: Int = 3;
    g: Bool = false;

    init() {
        self.a = null;
        self.b = null;
        self.s = "world";
        self.f = 42;
        self.g = true;
    }
}