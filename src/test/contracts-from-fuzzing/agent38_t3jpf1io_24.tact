contract DefaultsAndOverrides {
    a: Int = 1;
    b: Int = 2;
    c: Int; // no default

    init() {
        self.c = 3;
        self.b = 42;
    }
}