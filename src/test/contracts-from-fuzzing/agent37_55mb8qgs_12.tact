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
    val: Int;
}

contract LongChain {
    f: A;

    init() {
        self.f = A{ b: B{ c: C{ d: D{ val: 42 } } } };
    }
}
