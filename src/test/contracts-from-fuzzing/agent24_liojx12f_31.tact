// Deep optional chaining with nested struct with defaults
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

contract Test {
    a: A = A{
        b: null
    };
    init() {}
}