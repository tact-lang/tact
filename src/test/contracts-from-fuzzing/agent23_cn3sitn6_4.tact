// Contract with many Bool fields mixed with Ints
contract ManyBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Int;
    h: Bool;
    i: Int;
    j: Bool;

    init() {
        self.a = true;
        self.b = false;
        self.c = true;
        self.d = true;
        self.e = false;
        self.f = false;
        self.g = 0;
        self.h = true;
        self.i = 42;
        self.j = false;
    }
}