// test contract with a very large number of primitive persistent fields
contract ManyFieldsTest {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Cell;
    i: Address?;
    j: Cell?;
    k: Int;
    l: Bool;
    m: String;
    n: Int?;
    o: Bool?;
    p: String?;
    q: Address;
    r: Cell;
    s: Address?;
    t: Cell?;
    
    init() {
        self.a = 1;
        self.b = false;
        self.c = "c";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = myAddress();
        self.h = emptyCell();
        self.i = null;
        self.j = null;
        self.k = 2;
        self.l = true;
        self.m = "m";
        self.n = null;
        self.o = null;
        self.p = null;
        self.q = myAddress();
        self.r = emptyCell();
        self.s = null;
        self.t = null;
    }
}