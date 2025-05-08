contract TestManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Int;
    j: Int;
    k: Int;
    l: Int;
    m: Int;
    n: Int;
    o: Int;
    p: Int;
    q: Int;
    r: Int;
    s: Int;
    t: Int;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "test";
        self.d = myAddress();
        self.e = 2;
        self.f = true;
        self.g = "foo";
        self.h = myAddress();
        self.i = 0;
        self.j = 0;
        self.k = 0;
        self.l = 0;
        self.m = 0;
        self.n = 0;
        self.o = 0;
        self.p = 0;
        self.q = 0;
        self.r = 0;
        self.s = 0;
        self.t = 0;
    }
}