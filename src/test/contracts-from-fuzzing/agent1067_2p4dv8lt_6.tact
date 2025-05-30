struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

struct D {
    q: C;
}

contract DeepChain {
    chain: D;

    init() {
        self.chain = D{ q: C{ z: B{ y: A{ x: 123 } } } };
    }
}