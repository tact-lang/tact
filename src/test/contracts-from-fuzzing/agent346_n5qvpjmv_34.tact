contract InitDefaults {
    a: Int = 1;
    b: Int? = null;
    c: Bool = false;
    d: Bool? = null;

    init() {
        self.a = 10;
        self.b = null;
        self.c = true;
        self.d = null;
    }
}