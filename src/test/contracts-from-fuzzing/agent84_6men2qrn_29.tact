contract BoolDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool = true;
    d: Bool = false;

    init() {
        // override defaults partially
        self.a = false;
        self.b = true;
        self.c = false;
        self.d = true;
    }
}