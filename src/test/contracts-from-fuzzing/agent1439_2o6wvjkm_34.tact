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

struct E {
    corge: D;
}

struct F {
    grault: E;
}

contract DeepDeep {
    field: F;
    init() {
        self.field = F{ grault: E{ corge: D{ qux: C{ baz: B{ bar: A{foo: 77} } } } } };
    }
}