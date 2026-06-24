struct A {
    a1: Int;
    a2: Int;
}

struct B {
    b1: A;
    b2: Int;
}

struct C {
    c1: B;
    c2: Int;
}

contract Test {
    state: C;
    init() {
        self.state = C{
            c1: B{ b1: A{ a1: 1, a2: 2 }, b2: 3 },
            c2: 4
        };
    }
}