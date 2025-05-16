struct A {
    foo: Int;
}

struct B {
    bar: A;
}

struct C {
    baz: B;
}

struct D {
    qux: C;
}

contract FourDeepNested {
    d: D;

    init() {
        self.d = D{qux:C{baz:B{bar:A{foo:42}}}};
    }
}