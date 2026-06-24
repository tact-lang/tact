struct A { a1: Int; }
struct B { b1: Int; }
struct C { c1: Int; }
struct D { d1: Int; }
struct E { e1: Int; }
struct F { f1: Int; }
struct G { g1: Int; }
struct H { h1: Int; }

contract TestContract {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;
    f: F;
    g: G;
    h: H;
    init() {
        self.a = A{ a1: 1 };
        self.b = B{ b1: 2 };
        self.c = C{ c1: 3 };
        self.d = D{ d1: 4 };
        self.e = E{ e1: 5 };
        self.f = F{ f1: 6 };
        self.g = G{ g1: 7 };
        self.h = H{ h1: 8 };
    }
}