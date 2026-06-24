struct A {
    x: Int;
}

struct B {
    ax: A;
}

struct C {
    bx: B;
}

contract Chain {
    ref: C;

    init() {
        self.ref = C{bx: B{ax: A{x: 99}}};
    }
}