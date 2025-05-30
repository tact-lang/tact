contract TestMultiFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = 42;
        self.f = false;
        self.g = 7;
        self.h = null;
    }
}