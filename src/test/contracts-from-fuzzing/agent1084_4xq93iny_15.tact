// using extreme number of optional fields with mixed default
contract ManyOptionalsStress {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
    i: Int?;
    j: Int?;
    k: Int?;
    l: Int?;
    m: Int?;
    n: Int?;
    o: Int?;

    init() {
        self.a = null;
        self.b = null;
        self.c = 3;
        self.d = null;
        self.e = 5;
        self.f = null;
        self.g = 7;
        self.h = null;
        self.i = 9;
        self.j = null;
        self.k = 11;
        self.l = null;
        self.m = 13;
        self.n = null;
        self.o = 15;
    }
}