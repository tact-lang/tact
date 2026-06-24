contract LargePersistent {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: Int as uint64;
    g: Bool;
    h: String?;
    i: Int;
    j: Int?;
    k: Bool = true;
    l: String = "abc";
    m: Int as uint4 = 7;
    n: String?;
    o: Int as int16;
    p: Bool?;
    q: Int?;
    r: Bool = false;
    s: Int as uint8;
    t: String;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "c";
        self.d = null;
        self.e = true;
        self.f = 123456789;
        self.g = true;
        self.h = null;
        self.i = -1;
        self.j = 0;
        self.o = -500;
        self.p = false;
        self.q = 99;
        self.s = 255;
        self.t = "done";
    }
}