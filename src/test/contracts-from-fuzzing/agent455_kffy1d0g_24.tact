struct C {
    i: Int;
}

struct B {
    c: C;
}

struct A {
    field: B;
}

contract NestedChain {
    v: A;

    init() {
        self.v = A{
            field: B{
                c: C{
                    i: 100,
                },
            },
        };
    }
}