struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

struct D {
    c: C;
}

contract Test {
    storage: D;
    init() {
        self.storage = D{c: C{b: B{a: A{x: 123}}}};
    }
}