// deeply nested struct mixing optionals initialized explicitly
struct D {
    x: Int = 1;
}

struct C {
    d: D?;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract ExplicitNestedOpt {
    a: A = A{ b: B{ c: C{ d: D{} } } };
    init() {}
}