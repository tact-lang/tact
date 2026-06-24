struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

struct Complex {
    a: A;
    optA: A?;
    b: B;
    optB: B?;
    c: C;
    optC: C?;
    message: String?;
}

contract TestComplex {
    field: Complex;

    init() {
        self.field = Complex{
            a: A{x:1},
            optA: null,
            b: B{y:2},
            optB: null,
            c: C{z:3},
            optC: null,
            message: null
        };
    }
}