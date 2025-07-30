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
    e: Int;
}

contract LongNestTest {
    root: A;

    init() {
        self.root = A{ b: B{ c: C{ d: D{ e: 42 }}}};
    }
}