struct A {
    a: Int;
}

struct B {
    b: Int;
    nested_a: A;
}

contract OptionalNestedNormal {
    v: B? = null;
    init() {}
}