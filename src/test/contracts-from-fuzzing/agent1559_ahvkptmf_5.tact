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

contract ChainTest {
    chain: A;
    init() {
        self.chain = A{ b: B{ c: C{ d: D{ x: 777 } } } };
    }
}