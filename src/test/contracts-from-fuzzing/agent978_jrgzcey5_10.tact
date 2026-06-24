// test contract directly with a large number of persistent optional fields
contract LotsOfOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Int?;
    f: Bool?;
    g: Address?;
    h: String?;
    i: Int?;
    j: Bool?;
    k: Address?;
    l: String?;
    m: Int?;
    n: Bool?;
    o: Address?;
    p: String?;

    init() {
        self.a = null; self.b = null; self.c = null; self.d = null;
        self.e = null; self.f = null; self.g = null; self.h = null;
        self.i = null; self.j = null; self.k = null; self.l = null;
        self.m = null; self.n = null; self.o = null; self.p = null;
    }
}