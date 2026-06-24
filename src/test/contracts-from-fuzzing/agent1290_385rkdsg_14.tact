contract LargeContract {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool;
    g: Int as uint16;
    h: Int as int8;
    i: Bool;
    j: Int;
    k: String;
    l: Int?;
    m: String?;
    n: Int as int64;
    o: Int;
    p: Bool;
    q: String;
    r: Int?;
    s: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = null;
        self.e = null;
        self.f = false;
        self.g = 1000;
        self.h = -10;
        self.i = true;
        self.j = 100;
        self.k = "k";
        self.l = null;
        self.m = null;
        self.n = -3000;
        self.o = 4;
        self.p = false;
        self.q = "q";
        self.r = null;
        self.s = null;
    }

    receive() {
        self.a = 2;
        self.b = false;
        self.c = "cc";
        self.d = 42;
        self.e = "ee";
        self.f = true;
        self.g = 2000;
        self.h = 20;
        self.i = false;
        self.j = 200;
        self.k = "kk";
        self.l = 123;
        self.m = "mm";
        self.n = 3000;
        self.o = 5;
        self.p = true;
        self.q = "qq";
        self.r = 456;
        self.s = "ss";
    }
}