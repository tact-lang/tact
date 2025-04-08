struct A {
    foo: Int;
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

contract DeeplyNestedStruct {
    d: D;

    init() {
        self.d = D{ c: C{ b: B{ a: A{foo:1} } } };
    }
}