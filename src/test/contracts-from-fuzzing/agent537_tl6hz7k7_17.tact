contract TestContract {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;

    init() {
        self.a = 1; self.b = 2; self.c = 3; self.d = 4; self.e = 5;
        self.f = 6; self.g = 7; self.h = 8; self.i = 9; self.j = 10;
    }

    receive() {
        self.a = self.a;
        self.b = self.b;
        self.c = self.c;
        self.d = self.d;
        self.e = self.e;
        self.f = self.f;
        self.g = self.g;
        self.h = self.h;
        self.i = self.i;
        self.j = self.j;
    }
}
