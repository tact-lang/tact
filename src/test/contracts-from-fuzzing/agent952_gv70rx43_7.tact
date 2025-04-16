struct A {
    a: Int;
}

struct B {
    b: Int;
    a: A;
}

struct C {
    c: Int;
    b: B;
}

contract Test {
    nested: C;

    init() {
        self.nested = C{
            c: 3,
            b: B{
                b: 2,
                a: A{a: 1},
            }
        };
    }
}
