contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int as uint8;
    e: Int as int16;
    f: Int as int257;
    g: Int as coins;
    h: Address;
    i: Bool;
    j: String;
    k: Int;
    l: Int as uint8;
    m: Int as int16;
    n: Int as int257;
    o: Int as coins;
    p: Address;
    q: Bool;
    r: String;
    s: Int;
    t: Int as uint8;
    u: Int as int16;
    v: Int as int257;
    w: Int as coins;
    x: Address;
    y: Int;
    z: Bool;

    init() {
        self.a = 0;
        self.b = false;
        self.c = "";
        self.d = 0;
        self.e = 0;
        self.f = 0;
        self.g = 0;
        self.h = myAddress();
        self.i = true;
        self.j = "";
        self.k = 0;
        self.l = 0;
        self.m = 0;
        self.n = 0;
        self.o = 0;
        self.p = myAddress();
        self.q = false;
        self.r = "";
        self.s = 0;
        self.t = 0;
        self.u = 0;
        self.v = 0;
        self.w = 0;
        self.x = myAddress();
        self.y = 0;
        self.z = false;
    }

    receive() {
        self.a += 1;
    }
}