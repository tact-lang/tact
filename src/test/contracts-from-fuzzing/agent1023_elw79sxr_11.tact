contract TestPersistent {
    a: Int = 0;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = null;
    e: Int = 1;
    f: Bool = false;
    g: Int? = 2;
    h: Bool? = true;
    i: Int = 3;
    j: Bool = false;

    init() {
        self.a = 10;
        self.b = false;
        self.c = null;
        self.d = null;
        self.e = 20;
        self.f = true;
        self.g = 30;
        self.h = false;
        self.i = 40;
        self.j = true;
    }
}