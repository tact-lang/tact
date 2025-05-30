contract ManyPersistentFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Int?;
    f: Bool?;
    g: Address?;
    h: String?;
    i: Int;
    j: Bool;
    k: Address;
    l: String;
    m: Int?;
    n: Bool?;
    o: Address?;
    p: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "d";
        self.e = null;
        self.f = false;
        self.g = null;
        self.h = null;
        self.i = 2;
        self.j = false;
        self.k = myAddress();
        self.l = "l";
        self.m = null;
        self.n = null;
        self.o = null;
        self.p = null;
    }
}