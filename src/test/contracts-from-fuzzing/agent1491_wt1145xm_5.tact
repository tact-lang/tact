contract ManyFields {
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

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "d";
        self.e = 5;
        self.f = false;
        self.g = myAddress();
        self.h = "h";
        self.i = 9;
        self.j = true;
        self.k = myAddress();
        self.l = "l";
        self.m = 13;
        self.n = false;
        self.o = myAddress();
        self.p = "p";
    }
}