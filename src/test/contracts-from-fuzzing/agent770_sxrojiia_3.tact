struct A {
    a1: Int;
    a2: Bool;
    a3: String;
}

struct B {
    b1: A;
    b2: Bool;
    b3: Int;
}

struct C {
    c1: B;
    c2: Int?;
}

contract TestContract {
    storage: C;

    init() {
        self.storage = C{
            c1: B{
                b1: A{
                    a1: 1,
                    a2: true,
                    a3: "xyz"
                },
                b2: false,
                b3: 5
            },
            c2: null
        };
    }
}