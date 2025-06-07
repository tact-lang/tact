contract MixedManyFields {
    a: Int;
    b: Int as uint8;
    c: Bool;
    d: Cell;
    e: String;
    f: Int as int16;
    g: Bool;
    h: String;
    i: Address;
    j: Int as uint32;
    k: Bool;
    l: Cell;
    m: Int;
    n: Bool;
    o: String;
    p: Int as uint64;
    q: Address;
    r: Bool;
    s: String;
    t: Int as int8;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = emptyCell();
        self.e = "a";
        self.f = -16;
        self.g = false;
        self.h = "b";
        self.i = myAddress();
        self.j = 1000;
        self.k = true;
        self.l = emptyCell();
        self.m = -100;
        self.n = false;
        self.o = "c";
        self.p = 123456789;
        self.q = myAddress();
        self.r = true;
        self.s = "d";
        self.t = -8;
    }
}