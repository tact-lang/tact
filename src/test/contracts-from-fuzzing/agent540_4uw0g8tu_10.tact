struct A {
    a1: Int;
    a2: Int?;
}

struct B {
    b1: Int;
    b2: A;
}

struct C {
    c1: A;
    c2: B;
}

contract NestedMix {
    data: C;

    init() {
        self.data = C{
            c1: A{ a1: 1, a2: null },
            c2: B{ b1: 2, b2: A{ a1: 3, a2: null } }
        };
    }
}