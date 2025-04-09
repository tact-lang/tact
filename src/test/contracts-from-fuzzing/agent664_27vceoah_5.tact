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

contract DeepChain {
    field: D;

    init() {
        self.field = D{ qux: C{ baz: B{ bar: A{ foo: 1 } } } };
    }
}
