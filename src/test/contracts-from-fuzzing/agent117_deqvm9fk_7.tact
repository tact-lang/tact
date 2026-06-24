struct D {
    x: Int;
    y: Int;
}

struct C {
    d: D;
}

struct B {
    c: C;
}

struct A {
    b: B;
}

contract UltraDeep {
    a: A;

    init() {
        self.a = A{b: B{c: C{d: D{x: 7, y: 8}}}};
    }
}
