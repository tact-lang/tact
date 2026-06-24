contract BoolDefaults {
    a: Bool = false;
    b: Bool = true;
    c: Bool? = null;

    init() {
        self.a = true;
        self.b = false;
        self.c = true;
    }
}