struct E {
    f1: Int;
}

struct D {
    e1: E;
}

struct C {
    d1: D;
}

struct B {
    c1: C;
}

struct A {
    b1: B;
}

contract NestedChain {
    val: A;

    init() {
        self.val = A{ b1: B{ c1: C{ d1: D{ e1: E{ f1: 42 } } } } };
    }
}