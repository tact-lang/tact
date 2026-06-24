struct A {
    x: Int;
}

struct B {
    x: Int;
    nested: A;
}

struct C {
    x: Int;
    nested: B;
}

contract DeepChain {
    chain: C;

    init() {
        self.chain = C{ x: 1, nested: B{ x: 2, nested: A{ x: 3 } } };
    }
}