struct A { x: Int?; }
struct B { y: A; }
struct C { z: B; }

contract OptChain {
    c: C;
    init() {
        self.c = C{ z: B{ y: A{ x: null } } };
    }
}