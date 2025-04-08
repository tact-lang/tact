contract BoolDefaults {
    a: Bool = false;
    b: Bool? = null;
    c: Bool? = true;

    init() {
        self.a = true;
        self.b = false;
        self.c = null;
    }
}