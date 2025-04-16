struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract DeepChain {
    chain: C;

    init() {
        self.chain = C{
            b: B{
                a: A{
                    x: 42
                }
            }
        };
    }
}