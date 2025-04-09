contract ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Bool = true;
    f: Bool = false;

    init() {
        self.a = 11;
        self.b = 22;
        self.c = 33;
        self.d = 44;
        self.e = false;
        self.f = true;
    }
}