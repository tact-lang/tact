contract BigPersistentVars {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int as uint8;
    h: Int as int16;
    i: Int as uint32;
    j: Int as int64;
    k: Bool;
    l: Int;
    m: String;
    n: Bool?;
    o: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = null;
        self.e = false;
        self.f = null;
        self.g = 127;
        self.h = -32768;
        self.i = 4294967295;
        self.j = -123456789;
        self.k = false;
        self.l = 123456;
        self.m = "xyz";
        self.n = null;
        self.o = "hello";
    }
}