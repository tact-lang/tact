struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }
struct D { d: Int; }

contract FourStructs {
    sA: A;
    sB: B;
    sC: C;
    sD: D;

    init() {
        self.sA = A{ a:1 };
        self.sB = B{ b:2 };
        self.sC = C{ c:3 };
        self.sD = D{ d:4 };
    }
}