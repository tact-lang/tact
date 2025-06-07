struct A { x: Int; }
struct B { y: A; }
struct C { z: B; }

contract Chain {
    c: C;
    init() {
        self.c = C{ z: B{ y: A{ x: 11 } } };
    }
}