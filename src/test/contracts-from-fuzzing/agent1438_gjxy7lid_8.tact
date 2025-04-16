struct A {
    a1: Int = 1;
}

struct B {
    b1: A = A{};
}

struct C {
    c1: B = B{};
}

contract NestedInlineDefaults {
    foo: C = C{};
}