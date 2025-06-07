struct A {
    a1: Int;
}

struct B {
    b1: A;
}

struct C {
    c1: B;
}

struct D {
    d1: C;
}

contract Chain {
    data: D;

    init() {
        self.data = D{
            d1: C{
                c1: B{
                    b1: A{ a1: 123 }
                }
            }
        };
    }
}