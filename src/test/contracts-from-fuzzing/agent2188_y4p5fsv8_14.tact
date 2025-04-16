contract ChainedDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Int = 6;
    g: Int = 7;
    h: Int = 8;
    i: Int = 9;
    j: Int = 10;

    init() {
        self.a = self.b;
        self.b = self.c;
        self.c = self.d;
        self.d = self.e;
        self.e = self.f;
        self.f = self.g;
        self.g = self.h;
        self.h = self.i;
        self.i = self.j;
        self.j = 100;
    }
}