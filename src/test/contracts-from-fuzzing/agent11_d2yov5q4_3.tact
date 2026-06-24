struct A {
    a: Int;
}

struct B {
    b: Int;
    ref: A;
}

struct C {
    c1: Int;
    c2: Int?;
    ref: B;
}

contract MultiNested {
    state: C;

    init() {
        self.state = C{
            c1: 3,
            c2: null,
            ref: B{
                b: 2,
                ref: A{ a: 1 },
            },
        };
    }
}