contract OnlyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: String = "s";

    init() {
        // override
        self.a = 10;
        self.b = 20;
        self.c = false;
        self.d = "str";
    }
}
