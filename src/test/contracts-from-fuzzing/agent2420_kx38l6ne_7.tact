struct A { valA: Int; }
struct B { valB: Int; }
struct C { valC: Int; }
struct D { valD: Int; }
struct E { valE: Int; }

contract ManyStructs {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;

    init() {
        self.a = A{ valA:1 };
        self.b = B{ valB:2 };
        self.c = C{ valC:3 };
        self.d = D{ valD:4 };
        self.e = E{ valE:5 };
    }
}