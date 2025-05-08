struct A { x: Int; }
struct B { y: Int; a: A; }
struct C { z: Int; b: B; }

contract Chain {
    c: C;

    init() {
        self.c = C{ z: 9, b: B{ y: 8, a: A{ x: 7 } } };
    }
}