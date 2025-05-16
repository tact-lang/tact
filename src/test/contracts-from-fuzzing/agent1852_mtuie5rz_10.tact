struct A {
    v1: Int;
}

struct B {
    a: A;
    v2: Int;
}

struct C {
    b: B;
    v3: Int;
}

contract NestedChain {
    data: C;

    init() {
        self.data = C{
            b: B{
                a: A{v1: 11},
                v2: 22
            },
            v3: 33
        };
    }
}