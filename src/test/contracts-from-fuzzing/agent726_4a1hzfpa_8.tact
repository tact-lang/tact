struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: Int;
    b2: A;
}

struct C {
    c1: Int;
    c2: B;
}

struct D {
    d1: Int;
    d2: C;
}

contract ChainNested {
    data: D;
    init() {
        self.data = D{
            d1: 1,
            d2: C{
                c1: 2,
                c2: B{
                    b1: 3,
                    b2: A{
                        a1: 4,
                        a2: false
                    }
                }
            }
        };
    }
}