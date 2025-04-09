contract BoolDefaults {
    a: Bool = false;
    b: Bool = true;
    c: Bool = false;
    d: Bool = true;

    init() {
        self.a = true;
        self.b = false;
        self.c = true;
        self.d = false;
    }
}