contract BoolDefaults {
    a: Bool = false;
    b: Bool = true;
    c: Bool = false;

    init() {
        self.a = true;
        self.b = false;
        self.c = true;
    }
}