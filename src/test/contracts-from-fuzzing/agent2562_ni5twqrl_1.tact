contract TestLongFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Int;
    f: Bool;
    g: Address;
    h: String;
    i: Int;
    j: Bool;
    k: Address;
    l: String;
    m: Int;
    n: Bool;
    o: Address;
    p: String;
    q: Int;
    r: Bool;
    s: Address;
    t: String;
    u: Int;
    v: Bool;
    w: Address;
    x: String;
    y: Int;
    z: Bool;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "test";
        self.e = 2;
        self.f = false;
        self.g = myAddress();
        self.h = "test2";
        self.i = 3;
        self.j = true;
        self.k = myAddress();
        self.l = "test3";
        self.m = 4;
        self.n = false;
        self.o = myAddress();
        self.p = "test4";
        self.q = 5;
        self.r = true;
        self.s = myAddress();
        self.t = "test5";
        self.u = 6;
        self.v = false;
        self.w = myAddress();
        self.x = "test6";
        self.y = 7;
        self.z = true;
    }
}