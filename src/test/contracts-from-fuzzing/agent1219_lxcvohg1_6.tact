// Test very many contract fields of mixed types
contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String;
    h: Int;
    i: Bool;
    j: Address;
    k: String;
    l: Int;
    m: Int?;
    n: String;
    o: Address;
    p: Bool;
    q: String;
    r: Int;
    s: Int;
    t: Bool;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.e = null;
        self.f = null;
        self.g = "g";
        self.h = 2;
        self.i = false;
        self.j = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.k = "k";
        self.l = 3;
        self.m = null;
        self.n = "n";
        self.o = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.p = true;
        self.q = "q";
        self.r = 4;
        self.s = 5;
        self.t = false;
    }
}