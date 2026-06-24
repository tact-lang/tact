contract ManyPersistentFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Int?;
    f: Address;
    g: Bool;
    h: String?;
    i: Int as uint8;
    j: Int as uint32;
    k: Int as int16;
    l: Int as uint200;
    m: Bool;
    n: String;
    o: Address?;
    p: Int?;
    q: Cell;
    r: Bool;
    s: String;
    t: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "str";
        self.d = emptyCell();
        self.e = null;
        self.f = myAddress();
        self.g = false;
        self.h = null;
        self.i = 255;
        self.j = 10000;
        self.k = -123;
        self.l = 42;
        self.m = true;
        self.n = "hello";
        self.o = null;
        self.p = 99;
        self.q = emptyCell();
        self.r = false;
        self.s = "end";
        self.t = -999;
    }
}
