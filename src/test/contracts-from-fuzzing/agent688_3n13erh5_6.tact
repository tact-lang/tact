struct A {
    a1: Int?;
    a2: Int;
}

struct B {
    b1: A;
    b2: Int?;
}

struct C {
    c1: B;
    c2: A;
}

contract TestContract {
    foo: C;

    init() {
        self.foo = C{
            c1: B{ b1: A{ a1: null, a2:1 }, b2: null },
            c2: A{ a1: null, a2:2 }
        };
    }
}