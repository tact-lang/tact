contract ManyFieldsContract {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
    m: Int;
    n: Bool;
    o: String;
    p: Int?;
    q: Bool?;
    r: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "foo";
        self.d = null;
        self.e = false;
        self.f = null;
        self.g = 2;
        self.h = false;
        self.i = "bar";
        self.j = 3;
        self.k = null;
        self.l = "baz";
        self.m = 4;
        self.n = true;
        self.o = "qux";
        self.p = null;
        self.q = false;
        self.r = "zzz";
    }
}