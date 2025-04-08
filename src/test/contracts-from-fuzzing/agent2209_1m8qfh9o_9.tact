struct A {
    a1: Int;
    a2: Int;
}

struct B {
    b1: A;
    b2: A;
}

struct C {
    c1: B;
    c2: B;
}

contract TestContract {
    data: C;
    init() {
        self.data = C{
            c1: B{
                b1: A{a1:1,a2:2},
                b2: A{a1:3,a2:4},
            },
            c2: B{
                b1: A{a1:5,a2:6},
                b2: A{a1:7,a2:8},
            }
        };
    }
}