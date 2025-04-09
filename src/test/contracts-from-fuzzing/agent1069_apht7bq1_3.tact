contract ManyFields {
    a: Int;
    b: String;
    c: Bool;
    d: String?;
    e: Bool?;
    f: Int?;
    g: Address;
    h: Address?;
    i: Int;
    j: String;
    k: Bool;
    l: String?;
    m: Bool?;
    n: Int?;
    o: Address;
    p: Address?;

    init() {
        self.a = 1;
        self.b = "b";
        self.c = true;
        self.d = "d";
        self.e = false;
        self.f = 42;
        self.g = myAddress();
        self.h = myAddress();
        self.i = 2;
        self.j = "j";
        self.k = false;
        self.l = null;
        self.m = null;
        self.n = null;
        self.o = myAddress();
        self.p = null;
    }
}