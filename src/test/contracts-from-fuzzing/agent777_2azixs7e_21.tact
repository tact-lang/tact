struct D {
    d1: Int;
}

struct C {
    c1: D;
}

struct B {
    b1: C;
}

struct A {
    a1: B;
}

contract DeepChain {
    chain: A;

    init() {
        self.chain = A{
            a1: B{
                b1: C{
                    c1: D{ d1: 42 }
                }
            }
        };
    }
}