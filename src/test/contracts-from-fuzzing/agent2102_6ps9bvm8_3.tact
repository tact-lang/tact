struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: Int?;
    b2: A;
}

struct C {
    c1: Bool;
    c2: B;
}

contract ManyNested {
    data: C;

    init() {
        self.data = C{
            c1: false,
            c2: B{
                b1: null,
                b2: A{
                    a1: 12,
                    a2: true,
                },
            },
        };
    }
}