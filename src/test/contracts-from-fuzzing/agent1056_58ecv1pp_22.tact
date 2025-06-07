struct C {
    x: Int;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract DeepNullChain {
    chain: A;

    init() {
        self.chain = A{
            b: null
        };
    }
}