struct D {
    n: Int;
}

struct C {
    d: D;
}

struct B {
    c: C;
}

struct A {
    b: B;
}

contract PersistedChain {
    root: A;

    init() {
        self.root = A{
            b: B{
                c: C{
                    d: D{
                        n: 42,
                    },
                },
            },
        };
    }
}