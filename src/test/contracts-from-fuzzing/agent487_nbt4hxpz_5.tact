struct A {
    x: Int;
}

struct B {
    inner: A;
}

struct C {
    nested: B;
}

contract DeepNested {
    data: C = C{ nested: B{ inner: A{ x: 42 } } };

    init() {}
}