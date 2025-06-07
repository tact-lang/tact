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
    x: Int;
}

contract DeepChain {
    chain: A;

    init() {
        self.chain = A{
            b: B{
                c: C{
                    d: D{
                        x: 99
                    }
                }
            }
        };
    }
}