contract WithDefaults {
    a: Int = 17;
    b: Bool = true;
    c: Int? = null;

    init() {
        self.a = 42;
        self.b = false;
        self.c = 99;
    }
}