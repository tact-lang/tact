contract ManyBoolsAndOpts {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
    e: Bool;
    f: Bool?;
    g: Bool;

    init() {
        self.a = true;
        self.b = null;
        self.c = false;
        self.d = true;
        self.e = false;
        self.f = null;
        self.g = true;
    }
}