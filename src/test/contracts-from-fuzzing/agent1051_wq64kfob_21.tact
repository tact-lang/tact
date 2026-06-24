contract BoolAndIntWithDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Int = 7;
    d: Int = 0;

    init() {
        self.a = false;
        self.b = true;
        self.c = 42;
        self.d = -1;
    }
}