// contract with large flat number of persistent variables
contract TestContract {
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
    k: Int = 11;
    l: Int = 12;
    m: Bool = true;
    n: Bool = false;
    o: String = "a";
    p: String = "b";
    q: String = "c";
    r: Bool = true;

    init() {
        self.a = 100;
        self.b = 200;
        self.c = 300;
        self.d = 400;
        self.e = 500;
        self.f = 600;
        self.g = 700;
        self.h = 800;
        self.i = 900;
        self.j = 1000;
        self.k = 1100;
        self.l = 1200;
        self.m = false;
        self.n = true;
        self.o = "mod_a";
        self.p = "mod_b";
        self.q = "mod_c";
        self.r = false;
    }
}
