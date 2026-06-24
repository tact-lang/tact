struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D;
}

struct D {
    e: Int;
}

contract DeepChainStorage {
    chain: A;

    init() {
        self.chain = A{
            b: B{
                c: C{
                    d: D{
                        e: 99
                    }
                }
            }
        };
    }
}