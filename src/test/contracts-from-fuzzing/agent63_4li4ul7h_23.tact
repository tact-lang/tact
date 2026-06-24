contract ManyBoolDefaults {
    a: Bool = false;
    b: Bool = true;
    c: Bool = false;
    d: Bool = true;
    e: Bool = false;

    init() {
        self.a = true;
        self.b = false;
        self.c = true;
        self.d = false;
        self.e = true;
    }
}
