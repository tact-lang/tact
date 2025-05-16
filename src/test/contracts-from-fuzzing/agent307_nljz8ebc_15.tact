contract WithManyFields {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Bool?;
    f: Int?;
    g: String?;
    h: Bool;
    i: String;
    j: Int;
    k: Bool?;
    l: Int?;
    m: String?;
    n: Bool;
    o: Int;
    p: String?;
    q: Bool = false;
    r: String = "ok";

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = "d";
        self.e = false;
        self.f = 5;
        self.g = null;
        self.h = false;
        self.i = "i";
        self.j = 10;
        self.k = true;
        self.l = null;
        self.m = "m";
        self.n = true;
        self.o = 100;
        self.p = null;
    }
}