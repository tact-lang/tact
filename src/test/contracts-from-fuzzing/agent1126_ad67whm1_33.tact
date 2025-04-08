contract ManyNullableMix {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Int as uint8;
    e: Bool?;
    f: Int?;
    g: Bool;
    h: Int?;
    i: Bool;

    init() {
        self.a = null;
        self.b = true;
        self.c = 999;
        self.d = 12;
        self.e = false;
        self.f = null;
        self.g = true;
        self.h = null;
        self.i = false;
    }
}