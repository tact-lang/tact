struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

struct Big {
    a: A;
    b: B;
    c: C;
}

contract TestContract {
    data: Big;

    init() {
        self.data = Big{
            a: A{ x: 1 },
            b: B{ y: 2 },
            c: C{ z: 3 },
        };
    }
}