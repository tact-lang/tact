struct A {
    a: Int;
}

struct B {
    b: A;
}

struct C {
    c: B;
}

contract DeepChain {
    chain: C;

    init() {
        self.chain = C{ c: B{ b: A{ a: 123 } } };
    }
}