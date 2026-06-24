contract MixedOptionals {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Int?;
    f: Bool;
    g: Int;
    h: Bool?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = 5;
        self.f = false;
        self.g = 7;
        self.h = true;
    }
}