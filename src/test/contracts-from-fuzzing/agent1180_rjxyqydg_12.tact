struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: A;
    b2: Bool?;
}

struct C {
    c1: B;
    c2: A;
    c3: Int?;
}

contract DeepChain {
    storage: C;

    init() {
        self.storage = C{
            c1: B{
                b1: A{
                    a1: 5,
                    a2: true,
                },
                b2: false,
            },
            c2: A{
                a1: 10,
                a2: false,
            },
            c3: null,
        };
    }
}
