struct A {
    value: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract TestLongChain {
    chain: C;
    init() {
        self.chain = C {
            b: B {
                a: A {
                    value: 42
                }
            }
        };
    }
}