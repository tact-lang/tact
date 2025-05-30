struct A { x: Int; }
struct B { y: A; }
struct C { z: B; }
struct Complex {
    a: A;
    b: B;
    c: C;
}

contract Test {
    cmplx: Complex;

    init() {
        self.cmplx = Complex{
            a: A{ x: 1 },
            b: B{ y: A{ x: 2 } },
            c: C{ z: B{ y: A{ x: 3 } } }
        };
    }
}