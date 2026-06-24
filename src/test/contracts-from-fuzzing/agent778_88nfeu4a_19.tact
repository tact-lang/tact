contract BoolFieldsOnly {
    a: Bool = true;
    b: Bool = false;
    c: Bool = true;
    d: Bool = false;
    e: Bool = true;
    f: Bool = false;

    init() {
        self.a = false;
        self.b = true;
        self.c = false;
        self.d = true;
        self.e = false;
        self.f = true;
    }
}