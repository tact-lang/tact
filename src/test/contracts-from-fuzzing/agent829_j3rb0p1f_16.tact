contract ChainDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "hi";
    c: Int? = null;
    d: Bool? = true;

    init() {
        self.a = 100;
        self.b = true;
        self.s = "updated";
        self.c = 123;
        self.d = null;
    }
}