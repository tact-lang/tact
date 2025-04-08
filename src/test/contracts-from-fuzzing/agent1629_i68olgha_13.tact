struct A {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct B {
    g1: String;
    g2: A;
}

struct C {
    h1: B;
    h2: A;
    h3: String?;
}

contract MultiStructsInStorage {
    top: C;

    init() {
        self.top = C{
            h1: B{
                g1: "b",
                g2: A{
                    f1: 11,
                    f2: false,
                    f3: "a",
                },
            },
            h2: A{
                f1: 22,
                f2: true,
                f3: "second",
            },
            h3: null,
        };
    }
}