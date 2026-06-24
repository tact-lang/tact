struct A {
    b: B?;
}

struct B {
    c: C?;
}

struct C {
    d: D?;
}

struct D {
    x: Int?;
}

contract TestContract {
    nested: A;

    init() {
        self.nested = A{b: B{c: C{d: D{x: null}}}};
    }
}
