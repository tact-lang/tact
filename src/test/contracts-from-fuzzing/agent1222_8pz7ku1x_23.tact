contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: String = "c";
    d: Int;
    e: Bool;
    f: String = "f";
    g: Int;
    h: Bool = false;
    i: String;
    j: Int = 10;
    k: Bool;
    l: String = "l";
    m: Int;
    n: Bool = true;
    o: String;
    p: Int = 16;
    q: Bool;
    r: String;
    s: Int = 19;
    t: Bool = false;

    init() {
        self.d = 4;
        self.e = false;
        self.g = 7;
        self.i = "i";
        self.k = true;
        self.m = 13;
        self.o = "o";
        self.q = true;
        self.r = "r";
    }

    receive() {
        let sum = self.a + self.d + self.g + self.j + self.m + self.p + self.s;
        let _c = self.c;
        let _f = self.f;
        let _i = self.i;
        let _l = self.l;
        let _o = self.o;
        let _r = self.r;
        let bools = self.b && self.e && self.h && self.k && self.n && self.q && self.t;
    }
}