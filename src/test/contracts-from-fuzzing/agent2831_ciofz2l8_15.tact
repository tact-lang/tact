contract InlineDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
    d: Int? = null;
    e: Bool? = null;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "world";
        self.d = null;
        self.e = true;
    }
}
