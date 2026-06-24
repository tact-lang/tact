contract OptIntDefaults {
    a: Int? = null;
    b: Int? = 42;
    c: Int? = null;

    init() {
        self.a = 1;
        self.b = null;
        self.c = 3;
    }
}