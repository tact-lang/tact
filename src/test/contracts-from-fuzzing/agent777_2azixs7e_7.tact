struct A {
    f1: Int?;
    f2: Bool;
}

struct B {
    b1: A;
    b2: Int;
}

struct C {
    c1: B;
    c2: A;
}

contract MultiNested {
    data: C;

    init() {
        self.data = C{
            c1: B{
                b1: A{f1: null, f2: true},
                b2: 5
            },
            c2: A{f1: 123, f2: false}
        };
    }
}