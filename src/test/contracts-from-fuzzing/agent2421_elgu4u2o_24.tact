contract InlineDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "str";
    d: Int? = null;

    init() {
        self.a = 100;
        self.b = false;
        self.c = "new";
        self.d = null;
    }
}