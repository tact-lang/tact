contract ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
    k: Int as uint8;
    l: Int as int64;
    m: Int as coins;
    n: Bool;
    o: Bool?;
    p: String;
    q: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = "foo";
        self.f = null;
        self.g = emptyCell();
        self.h = null;
        self.i = myAddress();
        self.j = null;
        self.k = 255;
        self.l = 1234567890;
        self.m = 10000;
        self.n = false;
        self.o = null;
        self.p = "bar";
        self.q = null;
    }
}