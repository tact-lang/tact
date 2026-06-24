contract BoolDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool = true;
    d: Bool = false;

    init() {
        self.a = false;
        self.b = true;
        self.c = false;
        self.d = true;
    }
}