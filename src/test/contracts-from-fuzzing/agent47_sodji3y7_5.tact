struct A { a1: Int; }
struct B { b1: Bool; }
struct C { c1: Int?; c2: Bool?; }

contract TestContract {
    va: A;
    vb: B;
    vc: C;

    init() {
        self.va = A{ a1: 1 };
        self.vb = B{ b1: true };
        self.vc = C{ c1: null, c2: false };
    }
}