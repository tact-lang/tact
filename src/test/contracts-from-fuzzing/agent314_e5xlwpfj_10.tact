contract LongList {
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
    k: Bool;
    l: Bool;
    m: Bool;
    n: Bool;
    o: Bool;
    p: Address;
    q: Address;
    r: Address;
    s: String;
    t: String;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = 6;
        self.g = 7;
        self.h = 8;
        self.i = 9;
        self.j = 10;
        self.k = true;
        self.l = false;
        self.m = true;
        self.n = false;
        self.o = true;
        self.p = myAddress();
        self.q = myAddress();
        self.r = myAddress();
        self.s = "hello";
        self.t = "world";
    }
}