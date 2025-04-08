contract OnlyDefaults {
    a: Int = 5;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = false;

    init() {
        self.a = 15;
        self.b = false;
        self.c = null;
        self.d = true;
    }
}