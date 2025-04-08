struct A { a1: Int; }
struct B { b1: Int; a: A; }
struct C { c1: Int; b: B; }

contract Chain {
    cfield: C;

    init() {
        self.cfield = C{ c1: 1, b: B{ b1: 2, a: A{ a1:3 } } };
    }
}
