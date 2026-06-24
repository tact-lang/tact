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
    e: E?;
}

struct E {
    value: Int;
}

contract NestedOptionals {
    a: A = A{ b: null };

    init() {}
}
