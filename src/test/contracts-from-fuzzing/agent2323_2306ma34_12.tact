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
    e: E;
}

struct E {
    val: Int;
}

contract DeepChainTest {
    chain: A;

    init() {
        self.chain = A{ b: B{ c: C{ d: D{ e: E{ val: 123 } } } } };
    }
}