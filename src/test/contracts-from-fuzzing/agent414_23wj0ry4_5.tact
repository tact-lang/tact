struct A { a1: Int; a2: Int }
struct B { b1: Int; b2: Int }
struct C { c1: Int; c2: Int }
struct D { d1: Int; d2: Int }

contract ManyStructFields {
    f1: A;
    f2: B;
    f3: C;
    f4: D;

    init() {
        self.f1 = A{ a1: 1, a2: 2 };
        self.f2 = B{ b1: 3, b2: 4 };
        self.f3 = C{ c1: 5, c2: 6 };
        self.f4 = D{ d1: 7, d2: 8 };
    }
}