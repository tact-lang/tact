struct A {
    fieldA: Int;
}

struct B {
    fA: A;
    fieldB: Int;
}

struct C {
    fB: B;
    fieldC: Int;
}

contract TestDeepChain {
    store: C;
    init() {
        self.store = C{
            fB: B{
                fA: A{fieldA: 1},
                fieldB: 2
            },
            fieldC: 3
        };
    }
}
