struct A { f: Int }
struct B { f: Int }
struct C { f: Int }
struct D { f: Int }
struct E { f: Int }
struct F { f: Int }
struct G { f: Int }
struct H { f: Int }
struct I { f: Int }
struct J { f: Int }

contract TenStructsInStorage {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;
    f: F;
    g: G;
    h: H;
    i: I;
    j: J;

    init() {
        self.a = A{f:1};
        self.b = B{f:2};
        self.c = C{f:3};
        self.d = D{f:4};
        self.e = E{f:5};
        self.f = F{f:6};
        self.g = G{f:7};
        self.h = H{f:8};
        self.i = I{f:9};
        self.j = J{f:10};
    }
}