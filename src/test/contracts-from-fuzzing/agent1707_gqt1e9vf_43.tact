contract OptIntDefaults {
    a: Int? = null;
    b: Int? = 5;
    c: Int? = null;

    init() {
        self.a = 100;
        self.b = null;
        self.c = 200;
    }
}