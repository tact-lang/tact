struct A { x: Int; }
struct B { y: Int; a: A; }
struct C { z: Int; b: B; }
contract DeepMix {
    a: A;
    b: B;
    c: C;
    opt: C?;

    init() {
        self.a = A{ x: 1 };
        self.b = B{ y: 2, a: self.a };
        self.c = C{ z: 3, b: self.b };
        self.opt = null;
    }
}
