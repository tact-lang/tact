struct A { v: Int = 1; }
struct B { v: Int = 2; }
struct C { v: Int = 3; }
struct D { v: Int = 4; }
struct E { v: Int = 5; }
struct F { v: Int = 6; }
struct G { v: Int = 7; }

contract TestContract {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;
    f: F;
    g: G;

    init() {
        self.a = A{};
        self.b = B{};
        self.c = C{};
        self.d = D{};
        self.e = E{};
        self.f = F{};
        self.g = G{};
    }
}
