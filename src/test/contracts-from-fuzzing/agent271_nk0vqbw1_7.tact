struct A {
    f1: Int;
    f2: Bool;
}

struct B {
    g1: A;
    g2: A;
}

struct C {
    h1: B;
    h2: B;
}

contract TestContract {
    val: C;

    init() {
        self.val = C{
            h1: B{
                g1: A{ f1: 1, f2: true },
                g2: A{ f1: 2, f2: false }
            },
            h2: B{
                g1: A{ f1: 3, f2: true },
                g2: A{ f1: 4, f2: false }
            }
        };
    }
}